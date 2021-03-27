extends Node2D

#const tile_size = 16
#var mause_pos
#var tile_pos

#func _unhandled_input(action):
#	print("hello")
#	#global_position = get_global_mouse_position()
#	global_position = get_viewport().get_mouse_position()
#	tile_pos = Vector2(round(global_position.x / tile_size) * tile_size, round(global_position.y / tile_size) * tile_size)
#	print(tile_pos)

onready var grid_size = Vector2(get_viewport_rect().size.x,get_viewport_rect().size.y)
const cell_size = 16
var coord = Vector2(0,0)

func _ready(): set_process_input(true)

func _input(event):
	
	 if event is InputEventMouseMotion:
		var posX = round(get_viewport_transform().affine_inverse().xform(event.global_position).x / cell_size.x)
		var posY = round(get_viewport_transform().affine_inverse().xform(event.global_position).y / cell_size.y)
		 var pos = Vector2(posX, posY)
		 if pos != coord:
		  coord = pos
		 get_node("coord").clear()
		  get_node("coord").push_color(Color(1, 1, 0))
		 get_node("coord").push_underline()
		 #get_node("coord").set_pos(Vector2(coord.x * cell_size, coord.y * cell_size))
		 get_node("coord").add_text("coord = "+ str(coord))
		get_node("coord").pop()
	

func _draw():
 for x in range(0, grid_size.x, cell_size):
  for y in range(0, grid_size.y, cell_size):
   draw_line(Vector2(x, y), Vector2(x, y + cell_size), Color(0, 1, 0), 1.0)
   draw_line(Vector2(x, y), Vector2(x + cell_size, y), Color(0, 1, 0), 1.0)
