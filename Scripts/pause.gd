extends Node2D

class_name PauseManager

func _ready():
	if Global.last_world_position != Vector2(0,0):
		$player.position = Global.last_world_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# ---- Handling Pause Menu ----
signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false : 
	get : 
		return game_paused
	set(value):
		game_paused = value
		emit_signal("toggle_game_paused", game_paused)

func _input(event : InputEvent):
	if (event.is_action_pressed("pause")):
		game_paused = !game_paused
