extends Control

func scroll_in():
	Shortcuts.transition_sound.play()
	$AnimationPlayer.play("ScrollIn")
	
	$Attempts.text = "Attempts: %s" % GameData.attempts

func _on_MenuButton_pressed():
	GameData.reset()
	get_tree().change_scene("res://source/TitleScreen.tscn")