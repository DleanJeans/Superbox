extends Control

export(float) var wait_duration = 1.5

signal scrolled_down
signal scrolled_up

var skip_scroll_down_once = true

func setup(number, name):
	$Scenario.text = "Scenerio %s" % number
	$Name.text = name

func scroll():
	_scroll_down()
	_skip_scroll_down_if_requested()
	
	$Timer.wait_time = wait_duration
	$Timer.start()

func _scroll_down():
	$AnimationPlayer.play("ScrollDown")
	get_tree().paused = true
	yield($AnimationPlayer, "animation_finished")
	emit_signal("scrolled_down")

func _skip_scroll_down_if_requested():
	if skip_scroll_down_once:
		$AnimationPlayer.advance(0.5)
		skip_scroll_down_once = false

func _scroll_up():
	$AnimationPlayer.play_backwards("ScrollDown")
	yield($AnimationPlayer, "animation_finished")
	get_tree().paused = false
	emit_signal("scrolled_up")

func _process(delta):
	if not $Timer.is_stopped() \
	and (Input.is_action_just_pressed("left_click")
	or Input.is_action_just_pressed("action")):
		$Timer.stop()
		_scroll_up()