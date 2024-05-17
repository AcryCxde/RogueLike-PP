# иконка персонажа в меню сцены
@icon("res://Assets/Character/Character.png")
class_name Character
extends CharacterBody2D

@export var speed = 350
@export var friction: float = 0.5

# гравитация, можно изменить в настройках проекта: Physics/2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta) -> void:
	move()
	move_and_slide()

func move() -> void:
	var move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = move_direction * speed
