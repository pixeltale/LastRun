[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 1


; Don't remove the following line. It's required by the CMD standard.
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
trigger2 = movecontact
trigger3 = map(IBCheck) && HitShakeOver
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
triggerall = statetype != A
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
[State -1, LASTRIDE A TYPE - TIMES ARE GONE FOR HONEST MEN]
type = ChangeState
value = 3200
triggerall = map(Super_Type) = 1
triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0 && (var(2) || map(Termina.Time) > 1)
triggerall = command = "236236BC"
triggerall = statetype != A
trigger1 = var(2) || stateno = [3000,3010] && (map(Pursuit) >= 666 || map(Termina.Active))

;236236BC - Piercing Black Truth
[State -1, LASTRIDE B TYPE - DEATH IN THE COMFORT OF A LIE]
type = ChangeState
value = 3100
triggerall = map(Super_Type) = 2
triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0 && (var(2) || map(Termina.Time) > 1)
triggerall = command = "236236BC"
triggerall = statetype != A
trigger1 = var(2) || stateno = [3000,3010] && (map(Pursuit) >= 666 || map(Termina.Active))



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
[State -1, A GEAR - DIRTY TRICK] ;22BC
type = ChangeState
value = 2105
triggerall = map(Groove_Style) = 1
triggerall = command = "22D"
triggerall = statetype != A && stateno != [2100, 3000)
triggerall = stateno != [1000, 3000) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)
[State -1, A GEAR - BLACK HOLE]
type = ChangeState
value = 2100
triggerall = map(Groove_Style) = 1
triggerall = command = "214D"
triggerall = statetype != A && stateno != [2100, 3000) && !numhelper(2101)
triggerall = stateno != [1000, 3000) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)

[State -1, B GEAR - SEARING FLAME]
type = ChangeState
value = 2110 - 1*(statetype = A)
triggerall = map(Groove_Style) = 2
triggerall = command = "214D"
triggerall = (numhelper(2111) = 0 || statetype = A) && stateno != [2100, 3000)
triggerall = stateno != [1000, 3000) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)

[State -1, C GEAR - NUMBERED DAYS - DEATH EPITAPH] ;214BC
type = ChangeState
value = 2120
triggerall = map(Groove_Style) = 3
triggerall = command = "214D"
triggerall = statetype != A && stateno != [2100, 3000)
triggerall = stateno != [1000, 3000) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)
[State -1, C GEAR - DIRTY TRICK] ;22A
type = ChangeState
value = 2125
triggerall = map(Groove_Style) = 3
triggerall = command = "22A"
triggerall = numhelper(2120) && !movehitvar(overridden)
trigger1 = var(2)
[State -1, C GEAR - DIRTY TRICK] ;22B
type = ChangeState
value = 2123
triggerall = map(Groove_Style) = 3
triggerall = command = "22B"
triggerall = numhelper(2120) && !movehitvar(overridden)
trigger1 = var(2)
[State -1, C GEAR - DIRTY TRICK] ;22C
type = ChangeState
value = 2124
triggerall = map(Groove_Style) = 3
triggerall = command = "22C" && map(TP_Limiter) = 0
triggerall = numhelper(2120) && !movehitvar(overridden)
trigger1 = var(2)

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
value = 1021
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

;236A
[State -1, Crouching Heavy]
type = ChangeState
value = 1000
triggerall = !numhelper(1005)
triggerall = command = "236A"
triggerall = statetype != A
trigger1 = var(1)
;236B
[State -1, Crouching Heavy]
type = ChangeState
value = 1001
triggerall = !numhelper(1005)
triggerall = command = "236B"
triggerall = statetype != A
trigger1 = var(1)
;236C
[State -1, Crouching Heavy]
type = ChangeState
value = 2000
triggerall = !numhelper(2005)
triggerall = command = "236C"
triggerall = power >= 500
triggerall = statetype != A
trigger1 = var(1)

;214A
[State -1, Crouching Heavy]
type = ChangeState
value = 1010
triggerall = command = "214A"
trigger1 = var(1)
;214B
[State -1, Crouching Heavy]
type = ChangeState
value = 1015
triggerall = command = "214B"
trigger1 = var(1)
;214C
[State -1, Crouching Heavy]
type = ChangeState
value = 2010 - (1 * statetype = A)
triggerall = command = "214C"
triggerall = power >= 500
trigger1 = var(1)


;===========================================================================
;DEADZONE ATTACKS
;===========================================================================
;BC
[State -1, Standing Deadzone]
type = ChangeState
value = 700
triggerall = command = "D"
triggerall = statetype != A
trigger1 = ctrl
;jBC
[State -1, Aerial Deadzone]
type = ChangeState
value = 710
triggerall = command = "D"
triggerall = statetype = A
trigger1 = ctrl

;===========================================================================
;COMMAND NORMALS
;===========================================================================
;6C
[State -1, Crouching Heavy]
type = ChangeState
value = 240
triggerall = command = "C"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,225] || stateno = [400,410]) && movecontact
;6B
[State -1, Crouching Heavy]
type = ChangeState
value = 230
triggerall = command = "B"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,225] || stateno = [400,410]) && movecontact && (!combocount || command = "holdup")
;6B (Chainer)
[State -1, Crouching Heavy]
type = ChangeState
value = 231
triggerall = command = "B"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = (stateno = [200,225] || stateno = [400,410]) && movecontact && combocount && command != "holdup"

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
[State -1, Standing Heavy]
type = ChangeState
value = 220
triggerall = p2Dist X <= 50
triggerall = command = "C"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact

;5C (Far)
[State -1, Standing Heavy]
type = ChangeState
value = 225
triggerall = p2Dist X > 50
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
trigger1 = statetype = C
trigger1 = ctrl

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
value = 630
triggerall = command = "C"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,610] && MoveContact

