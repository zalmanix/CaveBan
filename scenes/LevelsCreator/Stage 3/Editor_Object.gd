extends Node2D

# A failure of a script
# This script can place objects in

var can_place = true
onready var level = get_node("/root/main/Level")
var tile_size = 16
var current_item

func _ready():
	pass

func _process(delta):
	#global_position.x = ((round(global_position.x / tile_size)) * tile_size)
	#global_position.y = ((round(global_position.y / tile_size)) * tile_size)
	#global_position = get_global_mouse_position()
	
	if(current_item != null and can_place and Input.is_action_just_pressed("action")):
		var new_item = current_item.instance()
		level.add_child(new_item)
		new_item.global_position = get_global_mouse_position()
		#new_item.position = Vector2(round(global_position.x / tile_size) * tile_size, round(global_position.y / tile_size) * tile_size)
	pass
