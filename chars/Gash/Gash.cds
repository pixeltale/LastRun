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
trigger1 = ctrl || stateno = 40 || stateno = 55
trigger2 = (stateno = [200,299]) || (stateno = [400,499] || stateno = [600,700]) 
trigger2 = movecontact
var(1) = 1
ignorehitpause = 1
[State -1, Super Cancel Special Attacks]
type = VarSet
triggerall = stateno != 2251
trigger1 = var(1)
trigger2 = stateno = [1000,3000) && MoveContact
trigger3 = (stateno = [1000, 1001] || stateno = 2000 ) && animelemno(0) > 3
trigger4 = stateno = [1000,1003] && animelemno(0) >= 3
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



;===========================================================================
;---------------------------------------------------------------------------
;Run
[State -1, Dash]
type = ChangeState
value = 100
triggerall = command = "66"
triggerall = statetype != A && stateno != [100, 101]
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
;236236X - RED HOT BLADE
[State -1, LASTRIDE A TYPE - CUT THROUGH THE DARK, RIDE BLACK LIGHTNING]
type = ChangeState
value = 3200 + 10*(statetype=A)
triggerall = map(Super_Type) = 1
triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0 && (var(2) || map(Termina.Time) > 1)
triggerall = command = "236236A" || command = "236236B" || command = "236236C"
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
[State -1, Flamagra Burnout]
type = ChangeState
value = 3000
triggerall = power >= 1000 || map(TERMINA.ACTIVE) > 0
triggerall = command = "214214A" || command = "214214B" || command = "214214C"
triggerall = statetype != A
trigger1 = var(2)


;===========================================================================
;ALTERNATIVE SPECIALS
;===========================================================================

[State -1, A GEAR - AIR DASH!]
type = ChangeState
value = 2100
triggerall = map(Groove_Style) = 1
triggerall = command = "FF" && !map(AirDash)
triggerall = statetype = A && (pos y < -60 || stateno = [1020,1025])
triggerall = (stateno != [1000, 3000) && stateno != [600,630]) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)

[State -1, B GEAR - TAMPA KING]
type = ChangeState
value = 2200
triggerall = map(Groove_Style) = 2
triggerall = command = "214D"
triggerall = statetype != A && stateno != [2100, 3000) && !numhelper(2101)
triggerall = stateno != [1000, 3000) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)
[State -1, B GEAR - RKO]
type = ChangeState
value = 2250
triggerall = map(Groove_Style) = 2
triggerall = command = "236D"
triggerall =  stateno != [2100, 3000) && !numhelper(2101)
triggerall = stateno != [1000, 3000) || (map(Pursuit) >= 333 || map(Termina.Active))
trigger1 = var(2)

;===========================================================================
;SPECIAL ATTACKS
;===========================================================================
;623A
[State -1, A DP]
type = ChangeState
value = 1020
triggerall = command = "426A"
trigger1 = var(1)
;623B
[State -1, B DP]
type = ChangeState
value = 1019
triggerall = command = "426B"
trigger1 = var(1)
;623C
[State -1, B DP]
type = ChangeState
value = 2020
triggerall = command = "426C"
triggerall = power >= 500
trigger1 = var(1)

;236A
[State -1, Crouching Heavy]
type = ChangeState
value = 1000
triggerall = !numhelper(1005)
triggerall = command = "236A" && command != "NO236"
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
triggerall = command = "236C"&& command != "NO236"
triggerall = power >= 500
triggerall = statetype != A
trigger1 = var(1)

;j236A
[State -1, Crouching Heavy]
type = ChangeState
value = 1002
triggerall = map(Groove_Style) = 1
triggerall = !numhelper(1005)
triggerall = command = "236A"
triggerall = statetype = A
trigger1 = var(1)
;j236B
[State -1, Crouching Heavy]
type = ChangeState
value = 1003
triggerall = map(Groove_Style) = 1
triggerall = !numhelper(1005)
triggerall = command = "236B"
triggerall = statetype = A
trigger1 = var(1)
;j236C
[State -1, Crouching Heavy]
type = ChangeState
value = 2001
triggerall = map(Groove_Style) = 1
triggerall = !numhelper(1005)
triggerall = command = "236C"
triggerall = statetype = A
trigger1 = var(1)

;214A
[State -1, Crouching Heavy]
type = ChangeState
value = 1010
triggerall = command = "214A"
triggerall = statetype != A
trigger1 = var(1)
;214B
[State -1, Crouching Heavy]
type = ChangeState
value = 1015
triggerall = command = "214B"
triggerall = statetype != A
trigger1 = var(1)
;214C
[State -1, Crouching Heavy]
type = ChangeState
value = 2010
triggerall = command = "214C"
triggerall = statetype != A
triggerall = power >= 500
trigger1 = var(1)

;===========================================================================
;COMMAND NORMALS
;===========================================================================
;3C
[State -1, Slide On Em']
type = ChangeState
value = 430
triggerall = command = "C"
triggerall = command = "holdfwd" && command = "holddown"
triggerall = statetype != A && command != "236C"
trigger1 = ctrl
trigger2 = (stateno = [200,220] || stateno = [400,420]) && movecontact && !combocount
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)
;3C (Chainer)
[State -1, Slide On Em']
type = ChangeState
value = 431
triggerall = command = "C"
triggerall = command = "holdfwd" && command = "holddown"
triggerall = statetype != A && command != "236C"
trigger1 = (stateno = [200,220] || stateno = [400,420]) && movecontact && combocount
trigger2 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)
;6C
[State -1, Clothesline]
type = ChangeState
value = 230
triggerall = command = "C"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,220] || stateno = [400,420]) && movecontact && (!combocount || command = "holdup")
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)
;6C (Chainer)
[State -1, Clothesline]
type = ChangeState
value = 231
triggerall = command = "C"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = (stateno = [200,220] || stateno = [400,420]) && movecontact && combocount && command != "holdup"
trigger2 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

;===========================================================================
;---------------------------------------------------------------------------
;5A
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = command = "A"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || stateno = 200 && movecontact && prevstateno != 200
trigger2 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

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
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

;---------------------------------------------------------------------------
;5C (Close)
[State -1, Standing Heavy]
type = ChangeState
value = 220
triggerall = p2BodyDist X <= 25
triggerall = command = "C"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

;5C (Far)
[State -1, Standing Heavy]
type = ChangeState
value = 225
triggerall = p2BodyDist X > 25
triggerall = command = "C"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

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
trigger1 = ctrl
trigger2 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

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
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

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
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

;---------------------------------------------------------------------------
;j.A
[State -1, Jump Light] 
type = ChangeState
value = 600
triggerall = command = "A"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

;---------------------------------------------------------------------------
;j.B
[State -1, Jump Medium]
type = ChangeState
value = 610
triggerall = command = "B"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && MoveContact
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)
;---------------------------------------------------------------------------
;j.C
[State -1, Jump Heavy]
type = ChangeState
value = 630
triggerall = command = "C"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,610] && MoveContact
trigger3 = map(TAMPAKINGDASH) && (stateno = 2210 || movecontact)

