extends Area2D

var occupied = false
onready var sprite1 = get_node("empty")
onready var sprite2 = get_node("full")

# Checking witch sprite Spot has to set
func _on_Spot_body_entered(body):
	if body.is_in_group('box'):
		occupied = true
		sprite1.visible = false
		sprite2.visible = true

# Checking witch sprite Spot has to set
func _on_Spot_body_exited(body):
	if body.is_in_group('box'):
		occupied = false
		sprite2.visible = false
		sprite1.visible = true
