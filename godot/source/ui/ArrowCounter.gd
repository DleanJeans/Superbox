extends Label

func update():
	var arrow_shooter = Shortcuts.arrow_shooter
	
	text = str(arrow_shooter.arrows_left)
	rect_global_position = arrow_shooter.position - Vector2(20, 10)

func show():
	update()
	.show()