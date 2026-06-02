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
triggerall = stateno != 420
trigger1 = ctrl || stateno = 40 || stateno = 55
trigger2 = (stateno = [200,299]) || (stateno = [400,499] || stateno = [600,710]) 
trigger2 = movecontact
var(1) = 1
ignorehitpause = 1
[State -1, Super Cancel Special Attacks]
type = VarSet
triggerall = statetype != A
trigger1 = var(1)
trigger2 = stateno = [1000,3000) && MoveContact
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
map 			= "PURSUITCANCEL_NORMALS"
value 		= 1
ignorehitpause = 1
[State -2, Pursuit Cancel - SPECIALS]
type 		= MapSet
trigger1 		= stateno = [1000,4000)
map 			= "PURSUITCANCEL_SPECIALS"
value 		= 1
ignorehitpause = 1
[State -2, Pursuit Cancel - SUPERS]
type 		= MapSet
trigger1 		= stateno = [4000,4500)
map 			= "PURSUITCANCEL_SUPERS"
value 		= 1
ignorehitpause = 1


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

;---------------------------------------------------------------------------
;Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "Throw"
triggerall = statetype != A
trigger1 = ctrl


;===========================================================================
;SUPER ATTACKS
;===========================================================================
;236236A
[State -1, A DP]
type = ChangeState
value = 3000
triggerall = command = "236BC"
triggerall = statetype != A
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
triggerall = command = "B" && command = "C"
triggerall = statetype != A
trigger1 = ctrl
;jBC
[State -1, Aerial Deadzone]
type = ChangeState
value = 710
triggerall = command = "B" && command = "C"
triggerall = statetype = A
trigger1 = ctrl

;===========================================================================
;COMMAND NORMALS
;===========================================================================
;6B
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
trigger2 = (stateno = [200,225] || stateno = [400,410]) && movecontact && !combocount
;6B (Chainer)
[State -1, Crouching Heavy]
type = ChangeState
value = 231
triggerall = command = "B"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = (stateno = [200,225] || stateno = [400,410]) && movecontact && combocount

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
triggerall = p2Dist X <= 55
triggerall = command = "C"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact

;5C (Far)
[State -1, Standing Heavy]
type = ChangeState
value = 225
triggerall = p2Dist X > 55
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

