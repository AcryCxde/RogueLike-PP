# иконка персонажа в меню сцены
@icon("res://Assets/Character/Character.png")

extends CharacterBody2D
class_name Character

const FRICTION: float = 0.4

@export var max_hp: int = 2
@export var hp: int = 2

@export var max_speed: int = 350
@export var acceleration: int = 150

@onready var state_machine: Node = get_node("FiniteStateMachine")
@onready var animated_sprite: AnimatedSprite2D = get_node("AnimatedSprite2D")

var move_direction: Vector2 = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)


func move() -> void:
	move_direction = move_direction.normalized()
	velocity += move_direction * acceleration
	velocity = velocity.limit_length(max_speed)


func take_damage(dam: int, dir: Vector2, force: int) -> void:
	hp -= dam
	state_machine.set_state(state_machine.states.hurt)
	velocity += dir * force

