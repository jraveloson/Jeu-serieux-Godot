extends Node2D

@export var pause_manager : PauseManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
