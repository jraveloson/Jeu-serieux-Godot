extends Node

var last_world_position = Vector2(0, 0)
var recommencer : bool = false
var scene_list = []
#Scene


var prestige = 0
var richesse = 30
var vie = 3


func _process(_delta):
	if recommencer:
		prestige = 0
		richesse = 30
		vie = 3
