extends TabContainer

onready var object_cursor = get_node("/root/main/Editor_Object")

func _ready():
	pass


func _on_TabContainer_mouse_entered():
	object_cursor.can_place = false
	pass 


func _on_TabContainer_mouse_exited():
	object_cursor.can_place = true
	pass 
