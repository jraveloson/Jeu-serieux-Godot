extends Area2D

@export var nom_label : Label
@export var nomObject = "default"


func _ready():
	nom_label = $nomPorte  # Assurez-vous que le nœud Label est correctement référencé dans la scène
	nom_label.text = nomObject
	nom_label.visible = false  # Rend le label invisible au début
	



func _process(delta):
	
	$nomPorte.position.x = $porte.position.x
	$nomPorte.position.y = $porte.position.y
	$nomPorte.position.y -= 50
	$nomPorte.position.x -= $nomPorte.get_size().x /2 
	var bodies = get_overlapping_bodies()
	for bodie in bodies:
		if bodie is CharacterBody2D:
			show_label()
	if bodies.is_empty():
		hide_label()

func show_label():
	
	nom_label.visible = true

func hide_label():
	
	nom_label.visible = false
