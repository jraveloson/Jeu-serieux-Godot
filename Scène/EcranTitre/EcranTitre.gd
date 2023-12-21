extends Control

@export var option_menu : OptionMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_bouton_quitter_pressed():
	get_tree().quit(0)


func _on_bouton_options_pressed():
	option_menu.show()

func _on_option_closed():
	show()
