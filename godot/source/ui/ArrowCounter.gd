extends Label

func update():
	var arrow_shooter = Shortcuts.arrow_shooter
	
	text = str(arrow_shooter.arrows_left)
	rect_position = arrow_shooter.position

func show():
	update()
	.show()