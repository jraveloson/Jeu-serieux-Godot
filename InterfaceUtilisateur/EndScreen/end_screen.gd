extends Control

class_name EndManager

var perdu : String = "Vous avez perdu ..."
var gagne : String = "Vous avez gagné !"

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func trigger_end_screen(endCondition : String):
	match endCondition:
		#Conditions de défaite
		"temps":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = perdu
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Durant 5 générations vous n'avez pas réussi à être noble..."
			show()
		"death":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = perdu
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Votre état de santé à eu raison de vous ..."
			show()
		"poverty":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = perdu
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Vous avez du vendre tout ce que vous aviez pour vous nourir ..."
			show()
		"dishonor":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = perdu
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Votre nom évoque rires et insultes à la cour royale ..."
			show()
			
		#Conditions de victoire
		"bought":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = gagne
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Vous avez acheté votre titre de noblesse !"
			show()
		"married":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = gagne
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Votre marriage vous accorde le titre de noble !"
			show()
		"king":
			$Panel/MarginContainer/VBoxContainer/endStateLabel.text = gagne
			$Panel/MarginContainer/VBoxContainer/endCondition.text = "Le roy vous a anobli devant la cour royale !"
			show()
		"notfinished":
			pass
		_:
			pass


func _on_restart_button_pressed():
	
	
	#Introduire l'appel à la fonction restart
	
	
	pass # Replace with function body.
	Global.recommencer = true
	get_tree().reload_current_scene()
	hide()

func _on_menu_button_pressed():
	hide()
	get_tree().change_scene_to_file("res://Scène/EcranTitre/EcranTitre.tscn")
	


func _on_quit_button_pressed():
	get_tree().quit(0)
