extends Character

@onready var weapon: Node2D = get_node("Weapon/WeaponSprite2D")
@onready var weapon_animation: AnimationPlayer = get_node("Weapon/WeaponAnimationPlayer")
@onready var bullet = preload("res://Scenes/bullet.tscn")
@onready var player_animation: AnimationPlayer = get_node("$AnimationPlayer")
@onready var player_state_machine: Node = get_node("FiniteStateMachine")

func _process(_delta) -> void:
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	if mouse_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
		weapon.flip_v = false
	elif mouse_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
		weapon.flip_v = true
	
	if (mouse_direction.x < 0 and Input.is_action_pressed("ui_right")) or (mouse_direction.x > 0 and Input.is_action_pressed("ui_left")):
		player_state_machine.set_state(player_state_machine.states.move_back)
	elif (mouse_direction.x > 0 and Input.is_action_pressed("ui_right")) or (mouse_direction.x < 0 and Input.is_action_pressed("ui_left")):
		player_state_machine.set_state(player_state_machine.states.move)
	
	weapon.rotation = mouse_direction.angle()
	
	if Input.is_action_just_pressed("ui_attack"):
		weapon_animation.play("weapon_attack")
		shoot()
	else:
		weapon_animation.play("weapon_idle")
		


func shoot() -> void:
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = $Weapon/WeaponSprite2D/Marker2D.global_transform


func get_input() -> void:
	move_direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		move_direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		move_direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		move_direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		move_direction += Vector2.UP
