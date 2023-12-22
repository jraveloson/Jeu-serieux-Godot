extends Node2D

@export var pause_manager : PauseManager
@export var ui_manager : UIManager
@export var end_menu : EndManager

func _ready():
	if Global.last_world_position != Vector2(0,0) && Global.recommencer != true:
		$player.position = Global.last_world_position
		if Global.recommencer:
			$player.position = Vector2(0,0)
			Global.recommencer = false
	ui_manager.updateUI()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$tavernier/CL_Tavernier/DialogueBoxTavernier.set_variable("prestige", TYPE_INT, Global.prestige)
	#$tavernier/CL_Tavernier/DialogueBoxTavernier.set_variable("richesse", TYPE_INT, Global.richesse)
	pass


# ---- Handling Pause Menu ---- #
func _input(event : InputEvent):
	if (event.is_action_pressed("pause")):
		pause_manager._on_scene_toggle_game_pause()

func verifyEndgame():
	
	
