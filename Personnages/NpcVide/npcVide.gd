extends Area2D

@export var nom_label : Label
@export var peutInterargir : bool = true
@export var nomNPC = "default"
@export var etatDialogue : bool = false





func _process(delta):
	$Zone_Detection_Joueur.position.x = $CorpsNPC.position.x
	$Nom.position.x = $CorpsNPC.position.x -40
	var bodies = get_overlapping_bodies()
	for bodie in bodies:
		if bodie is CharacterBody2D:
			$TimerDetection.start()
			show_label()
			if Input.is_action_pressed("Intéraction") && peutInterargir == true && etatDialogue == false:
				#$CanvasLayer/DialogueBox.start("Tavernier")
				pass
				
			
		elif not (bodie is CharacterBody2D) && $TimerDetection.time_left == 0:
			hide_label()
			#$CanvasLayer/DialogueBox.stop()
		elif not (bodie is CharacterBody2D) :
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
