extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.last_world_position != Vector2(0,0):
		$player.position = Global.last_world_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
