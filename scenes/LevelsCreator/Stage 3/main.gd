extends Node2D


func _ready():
	pass


func _on_exit_pressed():
	get_tree().change_scene("res://scenes/MainMenu/Difficulty/difficulty.tscn")
