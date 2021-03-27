extends TextureRect

export(PackedScene) var this_scene
onready var object_cursor = get_node("/root/main/Editor_Object")

onready var cursor_sprite = object_cursor.get_node("Sprite")

func _ready():
	connect("gui_input",self,"_item_clicked")
	pass

func _item_clicked(event):
	if(event is InputEvent):
		if(event.is_action_pressed("action")):
			object_cursor.current_item = this_scene
			cursor_sprite.texture = texture
	pass
