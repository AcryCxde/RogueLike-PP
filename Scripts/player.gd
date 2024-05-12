# иконка персонажа в меню сцены
@icon("res://Assets/Character/Character.png")

extends CharacterBody2D

const SPEED = 350

# гравитация, можно изменить в настройках проекта: Physics/2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	velocity = velocity.normalized() * SPEED
	move_and_slide()
