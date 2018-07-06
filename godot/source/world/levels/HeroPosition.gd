extends Position2D

export(bool) var only_once = true

var _set_once = false

func _ready():
	set_position()

func set_position():
	if only_once and _set_once: return
	
	_set_once = true
	Shortcuts.hero.position = position