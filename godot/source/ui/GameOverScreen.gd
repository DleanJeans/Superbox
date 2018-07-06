extends Control

func show_delayed():
	yield(get_tree().create_timer(0.5), "timeout")
	show()

func _restart():
	hide()
#	get_tree().reload_current_scene()
	Shortcuts.restarter.restart()

func _replay():
	hide()
	Replayer.start_replaying()

func _on_visibility_changed():
	get_tree().paused = visible