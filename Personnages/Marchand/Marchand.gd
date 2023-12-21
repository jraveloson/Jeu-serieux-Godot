extends Area2D

@export var nom_label : Label
@export var peutInterargir : bool = true
@export var nomNPC = "default"
@export var etatDialogue : bool = false
var prestige
var richesse





@warning_ignore("unused_parameter")
func _process(delta):
	$CL_Marchand/DialogueBoxMarchand.set_variable("prestige", TYPE_INT, Global.prestige)
	$CL_Marchand/DialogueBoxMarchand.set_variable("richesse", TYPE_INT, Global.richesse)
	$CL_Marchand/DialogueBoxMarchand.set_variable("bijou", TYPE_INT, Global.Bijou)
	$Zone_Detection_Joueur.position.x = $CorpsNPC.position.x
	$Nom.position.x = $CorpsNPC.position.x
	$Nom.position.y = $CorpsNPC.position.y
	$Nom.position.y -= 50
	$Nom.position.x -= $Nom.get_size().x /2
	var bodies = get_overlapping_bodies()
	for bodie in bodies:
		if bodie is CharacterBody2D:
			$TimerDetection.start()
			show_label()
			if Input.is_action_pressed("Intéraction") && peutInterargir == true && etatDialogue == false:
				$CL_Marchand/DialogueBoxMarchand.start("Marchand")
	if bodies.is_empty():
		hide_label()
		$CL_Marchand/DialogueBoxMarchand.stop()
	
			
	
	

func _ready():
	
	#Label
	nom_label = $Nom  # Assurez-vous que le nœud Label est correctement référencé dans la scène
	nom_label.text = nomNPC
	nom_label.visible = false  # Rend le label invisible au début
	$CL_Marchand/DialogueBoxMarchand.set_variable("prestige", TYPE_INT, Global.prestige)
	$CL_Marchand/DialogueBoxMarchand.set_variable("richesse", TYPE_INT, Global.richesse)
	$CL_Marchand/DialogueBoxMarchand.set_variable("bijou", TYPE_INT, Global.Bijou)
	
	

func show_label():
	nom_label.visible = true

func hide_label():
	nom_label.visible = false


func _on_dialogue_box_marchand_dialogue_ended():
	etatDialogue = false


func _on_dialogue_box_marchand_dialogue_started(_id):
	etatDialogue = true


func _on_dialogue_box_marchand_variable_changed(var_name, value):
	if var_name == "prestige":
		Global.prestige = value
	if var_name == "richesse":
		Global.richesse = value
	if var_name == "bijou":
		Global.Bijou = value

