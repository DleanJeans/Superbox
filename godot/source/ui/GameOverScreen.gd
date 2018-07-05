extends Control

func show_delayed():
	yield(get_tree().create_timer(0.5), "timeout")
	show()

func _restart():
	hide()
	get_tree().change_scene("res://source/Game.tscn")

func _replay():
	hide()
	Replayer.start_replaying()