extends Node2D

# Changing scene to menu
func _on_exit_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Difficulty/difficulty.tscn")
