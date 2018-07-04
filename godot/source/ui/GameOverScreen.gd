extends Control

func _on_visibility_changed():
	if visible:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _restart():
	hide()
	get_tree().change_scene("res://source/Game.tscn")

func _replay():
	hide()
	Replayer.start_replaying()