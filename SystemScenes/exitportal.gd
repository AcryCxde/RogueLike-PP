extends Area2D

var entered = false

func _on_player_entered(_body: PhysicsBody2D):
	if "Player" in _body.name:
		get_tree().quit()

