extends Control

class_name PauseManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_continuer_pressed():
	pass

func _on_quitter_pressed():
	get_tree().quit(0)


func _on_recommencer_pressed():
	Global.recommencer = true
	get_tree().change_scene_to_file("res://Scène/Amboise.tscn")
	get_tree().reload_current_scene()
	

# Connects the signal from the current scene to the _on_scene_toggle_game_pause function.
func connect_to_scene(scene):
	scene.connect("toggle_game_paused", self, "_on_scene_toggle_game_pause")

# This function is called when the connected scene emits the "toggle_game_paused" signal.
func _on_scene_toggle_game_pause(is_paused: bool):
	if is_paused:
		show()
	else:
		hide()
