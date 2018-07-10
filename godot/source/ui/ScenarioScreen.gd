extends Control

export(float) var wait_duration = 1.5

signal started_scrolling_down
signal scrolled_down
signal scrolled_up

func setup(number, name):
	$Scenario.text = "Scenerio %s" % number
	$Name.text = name

func scroll():
	_scroll_down()
	
	$Timer.wait_time = wait_duration
	$Timer.start()

func _scroll_down():
	show()
	Shortcuts.transition_sound.play()
	
	emit_signal("started_scrolling_down")
	$AnimationPlayer.play("ScrollDown")
	get_tree().paused = true
	
	yield($AnimationPlayer, "animation_finished")
	emit_signal("scrolled_down")

func _scroll_up():
	Shortcuts.transition_sound.play()
	$AnimationPlayer.play_backwards("ScrollDown")
	
	yield($AnimationPlayer, "animation_finished")
	get_tree().paused = false
	emit_signal("scrolled_up")
	hide()

func _process(delta):
	if not $Timer.is_stopped() \
	and (Input.is_action_just_pressed("left_click")
	or Input.is_action_just_pressed("action")):
		$Timer.stop()
		_scroll_up()