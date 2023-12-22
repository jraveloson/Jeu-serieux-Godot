extends Area2D

@export var nom_label : Label
@export var peutInterargir : bool = true
@export var nomNPC = "default"
@export var etatDialogue : bool = false




func _process(_delta):
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
			if Input.is_action_pressed("Intéraction") && Global.occupe == false && peutInterargir == true && etatDialogue == false:
				$CL_femme/DialogueBoxFemme.start("Femme")
	if bodies.is_empty():
		hide_label()

func _ready():
	
	#Label
	nom_label = $Nom  # Assurez-vous que le nœud Label est correctement référencé dans la scène
	nom_label.text = nomNPC
	nom_label.visible = false  # Rend le label invisible au début

	
	

func show_label():
	
	nom_label.visible = true

func hide_label():
	
	nom_label.visible = false

	
func _on_dialogue_box_dialogue_ended():
	$CorpsNPC.dialogueArret()
	etatDialogue = false


func _on_dialogue_box_dialogue_started(id):
	$CorpsNPC.dialogueLancer(id)
	etatDialogue = true
