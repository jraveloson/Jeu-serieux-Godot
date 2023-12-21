extends CharacterBody2D

@export var idDialogue = "Assaillant"


enum {
	Move,
	NewDir,
	idle
}

@export var vitesseDeplacement = 45 
@onready var animated_sprite2 : AnimatedSprite2D = $AnimationNPC
@export var currentState = idle
@export var dialogueActiver = false

var dir = Vector2.RIGHT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var last_position_x : float = 0



func _ready():
	$TimerAnimation.start()
	randomize()
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	move_and_slide()
	
func _process(delta):
	
	
	#Déplacement
	if is_on_floor() && dialogueActiver == false :
		match currentState:
			idle:
				animated_sprite2.play("idle")
			NewDir:
				dir = choose([Vector2.RIGHT, Vector2. LEFT])
			Move:
				move(delta)
	elif is_on_floor() && dialogueActiver == true:
		velocity.x = 0
		delta = 0
	if $TimerAnimation.time_left == 0:
		_on_timer_animation_timeout()
	
	
func move(delta):	
	if dir == Vector2.RIGHT:
		animated_sprite2.play("walk")
		animated_sprite2.flip_h = true
		position.x += 1 * vitesseDeplacement * delta
	elif dir == Vector2.LEFT:
		animated_sprite2.play("walk")
		animated_sprite2.flip_h = false
		position.x += -1 * vitesseDeplacement * delta	
	
func choose(array):
	array.shuffle()
	return array.front()
	
func dialogueLancer(id):
	if id == idDialogue:
		dialogueActiver = true
	


func dialogueArret():
	dialogueActiver = false
	


func _on_timer_correction_animation_timeout():
	if position.x != last_position_x:
		animated_sprite2.play("idle")


func _on_timer_animation_timeout():
	$TimerAnimation.wait_time = choose([1.5, 1, 2])
	currentState = choose([idle, NewDir, Move])
	$TimerAnimation.start()	
