extends CharacterBody2D


@export var speed : float = 200.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_locked : bool = false
var direction


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	if not animation_locked:
		if direction != 0:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")
			
func update_facing_direction():
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
