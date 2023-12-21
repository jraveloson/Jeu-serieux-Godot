extends Node2D

@export var pause_manager : PauseManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event : InputEvent):
	if (event.is_action_pressed("pause")):
		pause_manager._on_scene_toggle_game_pause()
