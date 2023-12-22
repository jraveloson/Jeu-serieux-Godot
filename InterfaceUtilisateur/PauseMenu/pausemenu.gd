extends Control

class_name PauseManager

@export var option_menu : OptionMenu

var game_paused : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

# This function is called when the connected scene emits the "toggle_game_paused" signal.
func _on_scene_toggle_game_pause():
	game_paused = !game_paused
	if game_paused:
		show()
	else:
		hide()

func _on_continuer_pressed():
	_on_scene_toggle_game_pause()


func _on_quitter_pressed():
	get_tree().quit(0);


func _on_recommencer_pressed():
	Global.recommencer = true
	#Trouver un moyen de relancer la partie 
	#get_tree().change_scene_to_file("res://Scène/Amboise.tscn")
	get_tree().change_scene_to_file("res://Scène/Amboise/Amboise.tscn")

func _on_option_pressed():
	option_menu.show()
	hide()

func on_option_menu_close():
	show()
