extends Area2D


var entered = false

func _on_player_entered(_body: PhysicsBody2D):
	entered = true



func _on_player_exited(_body: PhysicsBody2D):
	entered = false
