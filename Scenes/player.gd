extends CharacterBody2D

var speed = 300

# const

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# @onready

func _ready():
	pass

func _physics_process(delta):
	get_input()
	move_and_slide()

func get_input():
	var input_direction = Input.get_vector("move left", "move right", "move up", "move down")
	velocity = input_direction * speed
