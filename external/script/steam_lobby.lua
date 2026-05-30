-- steam_lobby.lua
-- Handles the Steam lobby flow for IkemenShell-launched games.
-- Players share a short room code (base-36 lobby ID) instead of the raw Steam lobby ID.
-- Provides f_host(), f_join(), f_lobbyInput() — all blocking, return true on success.

local M = {}

-- ---------------------------------------------------------------
-- Drawing helpers
-- ---------------------------------------------------------------

local function drawStatus(bg, lines)
    clearColor(
        motif[bg].bgclearcolor[1],
        motif[bg].bgclearcolor[2],
        motif[bg].bgclearcolor[3])
    bgDraw(motif[bg].BGDef, 0)
    rectDraw(motif.title_info.connecting.overlay.RectData)
    textImgReset(motif.title_info.connecting.TextSpriteData)
    textImgSetText(motif.title_info.connecting.TextSpriteData,
        type(lines) == 'table' and table.concat(lines, '\n') or tostring(lines))
    textImgDraw(motif.title_info.connecting.TextSpriteData)
    bgDraw(motif[bg].BGDef, 1)
    refresh()
end

-- Poll fn() until true or ESC. Returns false if cancelled.
local function waitFor(fn, bg, msg)
    resetKey()
    esc(false)
    while not fn() do
        if esc() then esc(false); return false end
        drawStatus(bg, msg)
    end
    return true
end

-- ---------------------------------------------------------------
-- Lobby code text input
-- ---------------------------------------------------------------

-- Prompt the player to type a lobby ID. Returns the string or nil if cancelled.
function M.f_lobbyInput()
    local bg = main.background
    local code = ''
    local prevKey  = ''
    local heldFor  = 0
    local DELAY    = 25  -- frames before repeat kicks in
    local RATE     = 4   -- frames between repeats once held

    resetKey()
    esc(false)
    while true do
        if esc() then esc(false); return nil end
        local k = getKey()

        -- debounce: only act on first press or after repeat delay
        local act = false
        if k ~= prevKey then
            act = k ~= ''
            heldFor = 0
        elseif k ~= '' then
            heldFor = heldFor + 1
            if heldFor >= DELAY and (heldFor - DELAY) % RATE == 0 then
                act = true
            end
        end
        prevKey = k

        if act then
            if k == 'RETURN' or k == 'KP_ENTER' then
                if #code > 0 then break end
            elseif k == 'BACKSPACE' then
                if #code > 0 then code = code:sub(1, -2) end
            elseif #k == 1 and #code < 20 then
                code = code .. k
            end
        end

        drawStatus(bg, {'Enter room code, then press Enter:', code .. '_'})
    end
    return code
end

-- ---------------------------------------------------------------
-- Host flow
-- ---------------------------------------------------------------

function M.f_host()
    local bg = main.background

    -- 1. Create lobby
    steamCreateLobby()
    if not waitFor(steamLobbyReady, bg, 'Creating Steam lobby...') then
        steamLeaveLobby()
        return false
    end

    local code = (steamLobbyCode and steamLobbyCode() ~= '' and steamLobbyCode()) or steamLobbyId()

    -- 2. Wait for opponent
    if not waitFor(steamPeerJoined, bg,
        {'Steam lobby ready!', 'Room code: ' .. code, '', 'Share this code with your opponent.', 'Waiting...'}) then
        steamLeaveLobby()
        return false
    end

    -- 3. Publish sync data (seed + preMatchTime)
    local seed = math.random(1, 2147483647)
    local pmt  = 0
    steamSetSyncData(seed, pmt)
    drawStatus(bg, 'Syncing...')

    -- 4. Start bridge relay
    steamStartRelay()
    if not waitFor(steamRelayReady, bg, 'Starting relay...') then
        steamLeaveLobby()
        return false
    end

    -- 5. Set up NetConnection + RollbackSession, wait for TCP relay handshake
    enterSteamPlay(true, seed, pmt)
    if not waitFor(connected, bg, 'Connecting...') then
        steamLeaveLobby()
        exitNetPlay()
        return false
    end
    if not synchronize() then
        steamLeaveLobby()
        exitNetPlay()
        return false
    end
    return true
end

-- ---------------------------------------------------------------
-- Join flow
-- ---------------------------------------------------------------

local function waitForJoin(bg, lobbyId)
    resetKey()
    esc(false)
    while true do
        if esc() then esc(false); return false end
        if steamLobbyReady() then return true end
        -- immediate failure feedback
        if steamJoinFailed and steamJoinFailed() then
            drawStatus(bg, {'Room not found.', 'Check the code and try again.', '', 'Press any key...'})
            resetKey()
            while getKey() == '' and not esc() do
                drawStatus(bg, {'Room not found.', 'Check the code and try again.', '', 'Press any key...'})
            end
            esc(false)
            return false
        end
        drawStatus(bg, 'Joining ' .. lobbyId .. '...')
    end
end

function M.f_join(lobbyId)
    local bg = main.background

    -- 1. Join lobby
    steamJoinLobby(lobbyId)
    if not waitForJoin(bg, lobbyId) then
        steamLeaveLobby()
        return false
    end

    -- 2. Wait for host's sync data (fires once via lobby_data_updated, no polling)
    if not waitFor(steamSyncDataReady, bg, 'Waiting for host...') then
        steamLeaveLobby()
        return false
    end
    local seed, pmt = steamGetSyncData()

    -- 3. Start bridge relay
    steamStartRelay()
    if not waitFor(steamRelayReady, bg, 'Starting relay...') then
        steamLeaveLobby()
        return false
    end

    -- 4. Set up NetConnection + RollbackSession, wait for TCP relay handshake
    enterSteamPlay(false, seed, pmt)
    if not waitFor(connected, bg, 'Connecting...') then
        steamLeaveLobby()
        exitNetPlay()
        return false
    end
    if not synchronize() then
        steamLeaveLobby()
        exitNetPlay()
        return false
    end
    return true
end

return M
