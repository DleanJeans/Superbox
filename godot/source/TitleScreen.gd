extends Control

func _ready():
	get_tree().paused = false
	yield(get_tree().create_timer(0.5), "timeout")
	$Animation/AnimationPlayer.play(".")
	$Animation/Arrow/TrailContainer/Trail.position = Vector2(-180, 0).rotated($Animation/Arrow.rotation)
	$Animation/Arrow2/TrailContainer/Trail.position = Vector2(-140, 0).rotated($Animation/Arrow2.rotation)

func _on_Button_pressed():
	GameData.reset()
	get_tree().change_scene("res://source/Game.tscn")