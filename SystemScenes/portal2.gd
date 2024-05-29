extends Area2D

var entered = false

func _on_player_entered(_body: PhysicsBody2D):
	if "Player" in _body.name:
		entered = false
		_body.global_position = Vector2(15670, 798)

func _on_player_exited(_body: PhysicsBody2D):
	entered = false
