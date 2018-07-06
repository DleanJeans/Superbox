extends Node

onready var me = get_parent()
onready var wall_collision = $"../WallCollision"
onready var jump_timer = $"../JumpTimer"

var _test_speed = 100
var _wall_normal
var _colliding_wall

var colliders

func call():
	_get_colliders()
	if not _is_touching_walls(): return
	
	_get_wall_prioritizing_floor()
	_get_wall_normal_from_test_motion()
	_process_wall_normal()
	_set_input_vector()
	_start_jump_timer()

func _get_colliders():
	colliders = wall_collision.get_overlapping_bodies()

func _is_touching_walls():
	return colliders.size() > 0 and colliders[0] is StaticBody2D

func _get_wall_prioritizing_floor():
	if colliders.has(Shortcuts.level_floor):
		_colliding_wall = Shortcuts.level_floor
	else: _colliding_wall = colliders[0]

func _get_wall_normal_from_test_motion():
	var vector_to_touched_wall = _colliding_wall.position - me.position
	var vector_to_test = vector_to_touched_wall * _test_speed
	var test_result = Physics2DTestMotionResult.new()
	
	me.test_motion(vector_to_test, 0.08, test_result)
	_wall_normal = test_result.collision_normal

func _process_wall_normal():
	if abs(_wall_normal.x) == 1:
		var normal_sign = sign(_wall_normal.x)
		_wall_normal = Vector2(2 * normal_sign, -1)

func _set_input_vector():
	me.input_vector = _wall_normal

func _start_jump_timer():
	jump_timer.start()