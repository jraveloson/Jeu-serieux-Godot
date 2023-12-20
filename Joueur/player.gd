extends CharacterBody2D


@export var speed : float = 200.0
@export var jump_velocity  : float = -200.0
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")	
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false
var dialogueActiver = false
var idDialogue


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
	else:
		if was_in_air == true:
			was_in_air = false
			animation_locked = false
	# Handle Jump.
	#if Input.is_action_just_pressed("jump"):
	#	if is_on_floor():
	#		jump()		

	var current_scene_name = get_tree().get_current_scene().get_name()
	
	# Comparaison avec une chaîne de caractères
	if current_scene_name == "Amboise":
		Global.last_world_position = position
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	if direction.x != 0 && dialogueActiver == false:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if not animation_locked:
		if direction.x != 0:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")
			
func update_facing_direction():
	if direction.x > 0 && dialogueActiver == false:
		animated_sprite.flip_h = false
	elif direction.x < 0 && dialogueActiver == false:
		animated_sprite.flip_h = true

func jump():
	velocity.y = jump_velocity
	animation_locked = true



func _on_dialogue_box_femme_dialogue_started(id):
	idDialogue = id
	dialogueActiver = true
	animated_sprite.play("idle")
	animation_locked = true
	
func _on_dialogue_box_tavernier_dialogue_started(id):
	idDialogue = id
	dialogueActiver = true
	animated_sprite.play("idle")
	animation_locked = true

func _on_dialogue_box_femme_dialogue_ended():
	if idDialogue == "Femme":
		dialogueActiver = false
		animation_locked = false

func _on_dialogue_box_tavernier_dialogue_ended():
	if idDialogue == "Tavernier":
		dialogueActiver = false
		animation_locked = false
	
