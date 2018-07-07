extends Node

export(float) var time = 3

func start():
	$Label.show()
	$Timer.wait_time = time
	$Timer.start()
	
	$Label.rect_scale *= 3
	$Label.self_modulate.a = 0
	
	while true:
		$AnimationPlayer.play(".")
		$Label.text = str(round($Timer.time_left))
		yield($AnimationPlayer, "animation_finished")
		if $Timer.time_left == 0:
			break

func stop():
	$Timer.stop()
	$AnimationPlayer.stop()
	$Label.hide()

func _timeout():
	Shortcuts.superhero_mode.on()