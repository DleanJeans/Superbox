extends Node

onready var me = get_parent()

var speed
var jump_force
var input_vector
var state

func call(state):
	self.state = state
	
	_update_properties()
	_integrate_x()
	_limit_velocity_x()
	_integrate_y()
	_limit_velocity_y()
	_integrate_angular(state)

func _update_properties():
	input_vector = me.input_vector
	jump_force = me.jump_force
	speed = me.speed

func _integrate_x():
	var horizontal = input_vector
	horizontal.y = 0
	
	me.apply_impulse(Vector2(), horizontal * speed)

func _limit_velocity_x():
	if abs(me.linear_velocity.x) > speed:
		state.linear_velocity.x = speed * sign(me.linear_velocity.x)

func _integrate_y():
	var vertical = input_vector
	vertical.x = 0
	
	me.apply_impulse(Vector2(), vertical * jump_force)

func _limit_velocity_y():
	if abs(me.linear_velocity.y) > jump_force:
		state.linear_velocity.y = jump_force * sign(me.linear_velocity.y)

func _integrate_angular(state):
	if me.get_colliding_bodies().size() > 0: return
	
	if input_vector.x < 0:
		state.angular_velocity = -PI * 2
	elif input_vector.x > 0:
		state.angular_velocity = PI * 2