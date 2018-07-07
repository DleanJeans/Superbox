extends Control

func show():
	yield(get_tree().create_timer(0.25), "timeout")
	.show()

func _restart():
	hide()
	Shortcuts.restarter.restart()

func _replay():
	hide()
	Replayer.start_replaying()

func _on_visibility_changed():
	get_tree().paused = visible