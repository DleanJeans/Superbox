extends Line2D

export(int) var length = 20

func _ready():
	reset()

func reset():
	points = PoolVector2Array()

func _add_point_at_current_position():
	add_point(Shortcuts.hero.position)
	if points.size() > length:
		remove_point(0)