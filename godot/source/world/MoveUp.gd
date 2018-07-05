extends Node

onready var me = get_parent()
onready var wall_collision = $"../WallCollision"
onready var jump_timer = $"../JumpTimer"

var colliders
var wall

func call():
	colliders = wall_collision.get_overlapping_bodies()
	
	if _is_touching_walls():
		_get_wall_prioritizing_floor()
		
		match wall.get_name():
			"Bottom": me.input_vector.y = -1
			"Left": me.input_vector = Vector2(1.5, -1).normalized()
			"Right": me.input_vector = Vector2(-1.5, -1).normalized()
			
		jump_timer.start()
	
	else: me.input_vector.y = 0

func _is_touching_walls():
	return colliders.size() > 0 and colliders[0] is StaticBody2D

func _get_wall_prioritizing_floor():
	if colliders.size() > 1 and colliders.has(Shortcuts.bottom_wall):
		wall = Shortcuts.bottom_wall
	else: wall = colliders[0]