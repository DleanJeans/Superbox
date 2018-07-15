extends Line2D

export(NodePath) var parent
export(int) var length = 20
export(bool) onready var paused = false setget set_paused
func set_paused(is_paused):
	paused = is_paused
	set_process(not paused)

onready var _parent = get_node(parent)

func _ready():
	reset()

func reset():
	points = PoolVector2Array()

func _process(delta):
	_add_point_at_current_position()

func _add_point_at_current_position():
	add_point(_parent.position)
	if points.size() > length:
		remove_point(0)