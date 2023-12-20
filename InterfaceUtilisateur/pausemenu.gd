extends Control

@export var pause_manager : PauseManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pause_manager.connect("toggle_game_paused", _on_scene_toggle_game_pause)


func _on_scene_toggle_game_pause(is_paused : bool):
	if (is_paused):
		show()
	else :
		hide()


func _on_continuer_pressed():
	pause_manager.game_paused = false


func _on_quitter_pressed():
	get_tree().quit(0);


func _on_recommencer_pressed():
	Global.recommencer = true
	get_tree().change_scene_to_file("res://Scène/Amboise.tscn")
	get_tree().reload_current_scene()
	
