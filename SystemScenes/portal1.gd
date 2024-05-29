extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
var allLevels = [position1, position2]
var entered = false
var position1 = Vector2(15670.0, 798.0)
var position2 = Vector2(1000.0, -22000.0)

func _on_player_entered(_body: PhysicsBody2D):
	entered = true
	if entered == true:
		var _nextLevel = allLevels.pick_random()

func _on_player_exited(_body: PhysicsBody2D):
	entered = false
