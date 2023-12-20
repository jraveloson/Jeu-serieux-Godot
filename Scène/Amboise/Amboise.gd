extends Node2D

@export var pause_manager : PauseManager

func _ready():
	if Global.last_world_position != Vector2(0,0) && Global.recommencer != true:
		$player.position = Global.last_world_position
		print($player.position)
		if Global.recommencer:
			$player.position = Vector2(0,0)
			Global.recommencer = false
			print("recommencer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$tavernier/CL_Tavernier/DialogueBoxTavernier.set_variable("prestige", TYPE_INT, Global.prestige)
	#$tavernier/CL_Tavernier/DialogueBoxTavernier.set_variable("richesse", TYPE_INT, Global.richesse)
	pass


# ---- Handling Pause Menu ----

# Signal de mise en "pause du jeu"


var game_paused : bool = false : 
	get : 
		return game_paused
	set(value):
		game_paused = value
		emit_signal("toggle_game_paused", game_paused)

func _input(event : InputEvent):
	if (event.is_action_pressed("pause")):
		pause_manager._on_scene_toggle_game_pause()

