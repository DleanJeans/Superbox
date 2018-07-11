extends Control

func _ready():
	get_tree().paused = false

func _on_Button_pressed():
	get_tree().change_scene("res://source/Game.tscn")