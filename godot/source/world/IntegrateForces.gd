extends Node

const ANGULAR_SPEED = PI * 2

onready var me = get_parent()

var speed
var jump_force
var state

func call(state):
	self.state = state
	
	_update_properties()
	_integrate_x()
	_limit_velocity_x()
	_integrate_y()
	_limit_velocity_y()
	_integrate_angular(state)
	_reset_velocity_if_dead()

func _reset_velocity_if_dead():
	if me.dead:
		state.linear_velocity = Vector2()

func _update_properties():
	jump_force = me.jump_force
	speed = me.speed

func _integrate_x():
	var horizontal = me.input_vector
	horizontal.y = 0
	
	me.apply_impulse(Vector2(), horizontal * speed)

func _limit_velocity_x():
	if abs(me.linear_velocity.x) > speed:
		state.linear_velocity.x = speed * sign(me.linear_velocity.x)

func _integrate_y():
	var vertical = me.input_vector
	vertical.x = 0
	var jump_vector = vertical * jump_force
	
	if jump_vector != Vector2():
		me.apply_impulse(Vector2(), jump_vector)

func _limit_velocity_y():
	if me.linear_velocity.y < -jump_force:
		state.linear_velocity.y = -jump_force

func _integrate_angular(state):
	if me.get_colliding_bodies().size() > 0: return
	
	if me.input_vector.x != 0:
		var velocity_sign = sign(state.angular_velocity)
		state.angular_velocity = ANGULAR_SPEED * velocity_sign