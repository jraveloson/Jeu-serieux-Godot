extends Control

class_name OptionMenu

@export var caller : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quitter_pressed():
	hide()
	caller.on_option_menu_close()

func _input(event : InputEvent):
	if (event.is_action_pressed("pause")):
		_on_quitter_pressed()
