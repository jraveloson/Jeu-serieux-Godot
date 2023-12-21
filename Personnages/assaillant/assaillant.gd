extends Area2D

@export var nom_label : Label
@export var peutInterargir : bool = true
@export var nomNPC = "Inconnu"
@export var etatDialogue : bool = false
var prestige
var richesse
var visibilite : bool
var idDialogue





@warning_ignore("unused_parameter")
func _process(delta):
	if visibilite != true:
		self.visible = false
		Global.tempsRestantAssaillant = $TimerVisibilite.time_left
	else:
		self.visible = true
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
			if Input.is_action_pressed("Intéraction") && peutInterargir == true && etatDialogue == false && visibilite == true:
				$CL_Assaillant/DialogueBoxAssaillant.start("Assaillant")
	if bodies.is_empty():
		hide_label()
		$CL_Assaillant/DialogueBoxAssaillant.stop()
	
			
	
	

func _ready():
	
	#Label
	nom_label = $Nom  # Assurez-vous que le nœud Label est correctement référencé dans la scène
	nom_label.text = nomNPC
	nom_label.visible = false  # Rend le label invisible au début
	$CL_Assaillant/DialogueBoxAssaillant.set_variable("prestige", TYPE_INT, Global.prestige)
	$CL_Assaillant/DialogueBoxAssaillant.set_variable("richesse", TYPE_INT, Global.richesse)
	if Global.tempsRestantAssaillant == 0:
		visibilite = true
	else:
		visibilite = false
		$TimerVisibilite.wait_time = Global.tempsRestantAssaillant
		$TimerVisibilite.start()

	

func show_label():
	nom_label.visible = true

func hide_label():
	nom_label.visible = false


func _on_dialogue_box_assaillant_dialogue_ended():
	$CorpsNPC.dialogueArret()
	etatDialogue = false
	if idDialogue == "Assaillant":
		visibilite = false
		Global.visibiliteAssaillant = false
		$TimerVisibilite.wait_time = 80
		$TimerVisibilite.start()
		



func _on_dialogue_box_assaillant_dialogue_started(id):
	idDialogue = id
	$CorpsNPC.dialogueLancer(id)
	etatDialogue = true


func _on_dialogue_box_assaillant_variable_changed(var_name, value):
	if var_name == "prestige":
		Global.prestige = value
	if var_name == "richesse":
		Global.richesse = value


func _on_timer_visibilite_timeout():
	visibilite = true
	Global.visibiliteAssaillant = true

