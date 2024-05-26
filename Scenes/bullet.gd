extends Area2D

@export var speed = 1000

func _physics_process(delta) -> void:
	position += transform.x * speed * delta



func _on_area_entered(area):
	if area.name == "Enemy":
		queue_free()
	
