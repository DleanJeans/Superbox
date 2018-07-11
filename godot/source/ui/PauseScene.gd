extends Container

func pause():
	if game_is_paused():
		return
	
	show()
	$AnimationPlayer.play("Pause")
	get_tree().paused = true

func unpause():
	if not game_is_paused():
		return
	
	$AnimationPlayer.play_backwards("Pause")
	get_tree().paused = false
	yield($AnimationPlayer, "animation_finished")
	hide()

func game_is_paused():
	return get_tree().paused

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause()

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		unpause()

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_WM_FOCUS_OUT:
			pause()
		MainLoop.NOTIFICATION_WM_FOCUS_IN:
			unpause()

func _on_MenuButton_pressed():
	get_tree().change_scene("res://source/TitleScreen.tscn")