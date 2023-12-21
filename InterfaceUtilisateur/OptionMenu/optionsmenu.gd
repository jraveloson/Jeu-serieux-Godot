extends Control

class_name OptionMenu

@export var caller : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Panel/MarginContainer/OptionBox/VBoxContainer/Master/MasterValue.text = str($Panel/MarginContainer/OptionBox/VBoxContainer/Master/HSlider.value)
	$Panel/MarginContainer/OptionBox/VBoxContainer/Effets/EffetsValue.text = str($Panel/MarginContainer/OptionBox/VBoxContainer/Effets/HSlider.value)
	$Panel/MarginContainer/OptionBox/VBoxContainer/Musique/MusiqueValue.text = str($Panel/MarginContainer/OptionBox/VBoxContainer/Musique/HSlider.value)

func _on_quitter_pressed():
	hide()
	if (caller.has_method("_on_option_pressed")):
		print("if")
		caller.on_option_menu_close()
	elif (caller.has_method("_on_option_closed")):
			print("elif")
			caller.show()

func _input(event : InputEvent):
	if (event.is_action_pressed("pause")):
		_on_quitter_pressed()

