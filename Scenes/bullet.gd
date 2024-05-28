extends Area2D

@export var speed = 1000

func _physics_process(delta) -> void:
	position += transform.x * speed * delta
