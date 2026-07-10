[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

[Statedef -1]



;===========================================================================
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(2) = 0

[State -1, Special Cancel Normal Attacks]
type = VarSet
triggerall = stateno != 240
trigger1 = ctrl || stateno = 40 || stateno = 55
trigger2 = (stateno = [200,299]) || (stateno = [400,499] || stateno = [600,700]) 
trigger2 = movecontact || time < 4
var(1) = 1
ignorehitpause = 1
[State -1, Super Cancel Special Attacks]
type = VarSet
trigger1 = var(1)
trigger2 = stateno = [1000,3000) && MoveContact
trigger3 = (stateno = [1000, 1001] || stateno = 2000 ) && animelemno(0) > 3
trigger4 = stateno = 2100 && animelemno(0) >= 2
var(2) = 1
ignorehitpause = 1

[State -2, Pursuit Cancel - Normals]
type 		= MapSet
trigger1 		= 1
map 			= "PURSUITCANCEL_NORMALS"
value 		= 0
ignorehitpause = 1
[State -2, Pursuit Cancel - Normals]
type 		= MapSet
trigger1 		= 1
map 			= "PURSUITCANCEL_SPECIALS"
value 		= 0
ignorehitpause = 1
[State -2, Pursuit Cancel - Normals]
type 		= MapSet
trigger1 		= 1
map 			= "PURSUITCANCEL_SUPERS"
value 		= 0
ignorehitpause = 1

[State -2, Pursuit Cancel - Normals]
type 		= MapSet
trigger1 		= (stateno = [200,299]) || (stateno = [400,499])
trigger1		= (movehit && map(Pursuit) >= 333 || moveguarded && map(Pursuit) >= 666 || map(TERMINA.ACTIVE))
map 			= "PURSUITCANCEL_NORMALS"
value 		= 1
ignorehitpause = 1
[State -2, Pursuit Cancel - SPECIALS]
type 		= MapSet
trigger1 		= stateno = [1000,4000)
trigger1		= (movehit && map(Pursuit) >= 333 || moveguarded && map(Pursuit) >= 666 || map(TERMINA.ACTIVE))
map 			= "PURSUITCANCEL_SPECIALS"
value 		= 1
ignorehitpause = 1



;===========================================================================



;===========================================================================
;---------------------------------------------------------------------------
;Run
[State -1, Dash]
type = ChangeState
value = 100
triggerall = command = "66"
triggerall = statetype != A && stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Backdash
[State -1, Back Dash]
type = ChangeState
value = 105
triggerall = command = "44"
triggerall = statetype != A
trigger1 = ctrl

;===========================================================================
;ALTERNATIVE SUPER ATTACKS
;===========================================================================
;236236BC - Black Hole Sun
;[State -1, LASTRIDE A TYPE - TIMES ARE GONE FOR HONEST MEN]
;type = ChangeState
;value = 3200
;triggerall = map(Super_Type) = 1
;triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0 && (var(2) || map(Termina.Time) > 1)
;triggerall = command = "236236A" || command = "236236B" || command = "236236C"
;triggerall = statetype != A
;trigger1 = var(2) || stateno = [3000,3010] && (map(Pursuit) >= 666 || map(Termina.Active))

;236236BC - Piercing Black Truth
;[State -1, LASTRIDE B TYPE - DEATH IN THE COMFORT OF A LIE]
;type = ChangeState
;value = 3100
;triggerall = map(Super_Type) = 2
;triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0 && (var(2) || map(Termina.Time) > 1)
;triggerall = command = "236236A" || command = "236236B" || command = "236236C"
;triggerall = statetype != A
;trigger1 = var(2) || stateno = [3000,3010] && (map(Pursuit) >= 666 || map(Termina.Active))



;===========================================================================
;SUPER ATTACKS
;===========================================================================
;632146X
[State -1, Ranbu Super]
type = ChangeState
value = 3000
triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0
triggerall = command = "632146A" || command = "632146B" || command = "632146C"
triggerall = statetype != A
trigger1 = var(2)


;===========================================================================
;ALTERNATIVE SPECIALS
;===========================================================================
;Not Implemented

;===========================================================================
;SPECIAL ATTACKS
;===========================================================================
;623A
[State -1, A DP]
type = ChangeState
value = 1020
triggerall = command = "623A"
triggerall = statetype != A
trigger1 = var(1)
;623B
[State -1, B DP]
type = ChangeState
value = 1020
triggerall = command = "623B"
triggerall = statetype != A
trigger1 = var(1)
;6233
[State -1, B DP]
type = ChangeState
value = 2020
triggerall = command = "623C"
triggerall = power >= 500
triggerall = statetype != A
trigger1 = var(1)

;214A
[State -1, Crouching Heavy]
type = ChangeState
value = 1000
triggerall = command = "214A"
triggerall = statetype != A
trigger1 = var(1)
;236B
[State -1, Crouching Heavy]
type = ChangeState
value = 1001
triggerall = command = "214B"
triggerall = statetype != A
trigger1 = var(1)
;236C
[State -1, Crouching Heavy]
type = ChangeState
value = 2000
triggerall = command = "214C"
triggerall = power >= 500
triggerall = statetype != A
trigger1 = var(1)

;[4]6A
[State -1, Crouching Heavy]
type = ChangeState
value = 1010 + 20 * statetype = A
triggerall = command = "[4]6A"
trigger1 = var(1)
;[4]6A
[State -1, Crouching Heavy]
type = ChangeState
value = 1011 + 20 * statetype = A
triggerall = command = "[4]6B"
trigger1 = var(1)
;[4]6A
[State -1, Crouching Heavy]
type = ChangeState
value = 2010
triggerall = command = "[4]6C"
triggerall = statetype != A
trigger1 = var(1)

;===========================================================================
;COMMAND NORMALS
;===========================================================================
;Mash C
[State -1, Crouching Heavy]
type = ChangeState
value = 230
triggerall = command = "MashC"
triggerall = statetype != A
trigger1 = (stateno = [220,225] || stateno = 420) && movecontact

;===========================================================================
;---------------------------------------------------------------------------
;5A
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = command = "A"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;5B
[State -1, Standing Medium]
type = ChangeState
value = 210
triggerall = command = "B"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact

;---------------------------------------------------------------------------
;5C (Close)
;[State -1, Standing Heavy]
;type = ChangeState
;value = 220
;triggerall = p2BodyDist X <= 25
;triggerall = command = "C"
;triggerall = command != "holddown"
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact

;5C (Far)
[State -1, Standing Heavy]
type = ChangeState
value = 225
;triggerall = p2BodyDist X > 25
triggerall = command = "C"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;2A
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "A"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl || stateno = [100, 101] || stateno = [10, 11]

;---------------------------------------------------------------------------
;2B
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "B"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact

;---------------------------------------------------------------------------
;2C
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = command = "C"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact

;---------------------------------------------------------------------------
;j.A
[State -1, Jump Light] 
type = ChangeState
value = 600
triggerall = command = "A"
triggerall = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;j.B
[State -1, Jump Medium]
type = ChangeState
value = 610
triggerall = command = "B"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && MoveContact
;---------------------------------------------------------------------------
;j.C
[State -1, Jump Heavy]
type = ChangeState
value = 620
triggerall = command = "C"
triggerall = statetype = A && !map(NeutralJump)
trigger1 = ctrl
trigger2 = stateno = [600,610] && MoveContact

;---------------------------------------------------------------------------
;nj.C
[State -1, Jump Heavy]
type = ChangeState
value = 625
triggerall = command = "C"
triggerall = statetype = A && map(NeutralJump)
trigger1 = ctrl
trigger2 = stateno = [600,610] && MoveContact

