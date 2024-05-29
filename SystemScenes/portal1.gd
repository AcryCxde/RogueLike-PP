extends Area2D

var level1 = Vector2(15670, 798)
var level2 = Vector2(1000, -21500)
var levelpick = [1,2,3,4,5,6]
#1 и 3 - первый уровень
#2 и 5 - второй уровень
#4 и 6 - третий уровень
var entered = false
var nextLevel

func _on_player_entered(_body: PhysicsBody2D):
	entered = true
	nextLevel = levelpick.pick_random()
	
	if (nextLevel == 1) or (nextLevel == 3):
		if entered == true:
			if "Player" in _body.name:
				entered = false
				_body.global_position = level1
	
	if (nextLevel == 2) or (nextLevel == 5):
		if entered == true:
			if "Player" in _body.name:
				entered = false
				_body.global_position = level2
	
	#if (nextLevel == 4) or (nextLevel == 6):
		#if entered == true:
			#if "Player" in _body.name:
				#entered = false
				#_body.global_position = level3



func _on_player_exited(_body: PhysicsBody2D):
	entered = false
