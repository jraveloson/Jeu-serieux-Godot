extends Control

class_name UIManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func updateUI():
	$"VBoxContainer/Gold Container/GoldLabel".text = str(Global.richesse)
	$"VBoxContainer/Prestige Container/PrestigeLabel".text = str(Global.prestige)
