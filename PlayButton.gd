extends Button

var allMaps = [preload("res://Levels/Level1.tscn"), preload("res://Levels/Level2.tscn")]
var randMap = allMaps.pick_random()

func _on_pressed():
	get_tree().change_scene_to_file("res://Levels/game.tscn")

#func _physics_process(_delta):
	#if Input.is_action_pressed("ui_up"):
		#
