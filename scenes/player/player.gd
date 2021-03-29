extends KinematicBody2D

onready var ray =$RayCast2D
var grid_size = 16
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}
var test = false

# Handling imputs 
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir) and GameManager.canmove:
			test = false
			if $Tween.is_active() == false:
				move(dir)
				if test == true:
					MusicController.play_step()
					GameManager.maxmoves -= 1
	if event.is_action_pressed("reset"): 
		get_tree().reload_current_scene()


func move(dir):
	var vector_pos = inputs[dir] * grid_size
	var spr = vector_pos
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	$Tween.interpolate_property(
		self, "position", position,
		position + vector_pos, 0.13,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	if !ray.is_colliding():
		$Tween.start()
		test = true
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			if collider.move(dir):
				$Tween.start()
				test = true


func _on_Tween_tween_all_completed():
	get_parent().check_end()
