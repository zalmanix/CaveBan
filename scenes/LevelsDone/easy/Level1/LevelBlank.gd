extends Node2D

var game_end = false
var moves = 0

func _process(delta):
	$ui/Moves.text = 'Moves: ' + str(moves)
	
func check_end():
	if game_end == false: 
		var spots = $spots.get_child_count()
		for i in $spots.get_children():
			if i.occupied:
				spots -= 1
		
		if spots == 0:
			$ui/AcceptDialog.popup()
			game_end = true





func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
