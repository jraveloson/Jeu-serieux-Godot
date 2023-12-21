extends Control

class_name UIManager

@export var fullHeart : CompressedTexture2D
@export var emptyHeart : CompressedTexture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$"ProgressBar".max_value = Global.tempsMax



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	updateUI()

func updateUI():
	$"VBoxContainer/Gold Container/GoldLabel".text = str(Global.richesse)
	$"VBoxContainer/Prestige Container/PrestigeLabel".text = str(Global.prestige)
	updateHealth()
	updateTime()
	
func updateTime():
	$"ProgressBar".value = Global.tempsJeu

func updateHealth():
	match Global.vie:
		3:
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon".texture = fullHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon2".texture = fullHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon3".texture = fullHeart
		2:
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon".texture = fullHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon2".texture = fullHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon3".texture = emptyHeart
		1:
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon".texture = fullHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon2".texture = emptyHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon3".texture = emptyHeart
		0:
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon".texture = emptyHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon2".texture = emptyHeart
			$"VBoxContainer/Health Container/HBoxContainer/HealthIcon3".texture = emptyHeart
