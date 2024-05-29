extends Area2D

var allMaps = [preload("res://Levels/lvl_1.tscn"), preload("res://Levels/lvl_2.tscn")]
var entered = false

func _on_player_entered(_body: PhysicsBody2D):
	entered = true
	if entered == true:
		var nextScene = allMaps.pick_random()
		get_tree().change_scene_to_packed(nextScene)


func _on_player_exited(_body: PhysicsBody2D):
	entered = false
