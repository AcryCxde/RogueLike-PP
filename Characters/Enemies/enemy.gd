@icon("res://Assets/Enemy/Skeleton Crew/Skeleton - Base/Icon Sceleton - Base.png")

extends Character
class_name Enemy

@onready var player: Node2D = get_node("../Player")
@onready var path_timer: Timer = get_node("PathTimer")
@onready var navigation_agent: NavigationAgent2D = get_node("NavigationAgent2D")


func chase() -> void:
	var move_direction = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = move_direction * acceleration
	move_and_slide()
	
	if move_direction.x > 0 and animated_sprite.flip_h:
		animated_sprite.flip_h = false
	elif move_direction.x < 0 and not animated_sprite.flip_h:
		animated_sprite.flip_h = true
	if navigation_agent.is_target_reached():
		create_path()


func create_path() -> void:
	navigation_agent.target_position = player.global_position
	navigation_agent.set_target_location(player.global_position)


func _on_PathTimer_timeout():
	create_path()

func _ready() -> void:
	path_timer.start()
