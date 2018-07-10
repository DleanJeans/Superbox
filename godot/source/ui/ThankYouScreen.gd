extends Control

func scroll_in():
	Shortcuts.transition_sound.play()
	$AnimationPlayer.play("ScrollIn")