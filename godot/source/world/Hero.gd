extends RigidBody2D

signal died
signal hit_by_arrow(arrow)
signal got_superpower

export(int) var speed = 100
export(int) var jump_force = 800

export(int) var normal_speed = 100
export(int) var super_speed = 500

export(int) var normal_jump_force = 800
export(int) var super_jump_force = 1500
export(float) var super_time_scale = 0.2

var input_vector = Vector2()
var dead = false

export(bool) var superhero_mode = false setget set_superhero_mode
func set_superhero_mode(enabled):
	superhero_mode = enabled
	
	if enabled:
		emit_signal("got_superpower")
		speed = super_speed
		jump_force = super_speed
		Engine.time_scale = super_time_scale
	else:
		speed = normal_speed
		jump_force = normal_jump_force
		Engine.time_scale = 1

func toggle_superpower_mode():
	self.superhero_mode = not superhero_mode

func hit_by_arrow(arrow):
	if dead: return
	
	emit_signal("hit_by_arrow", arrow)
	die()

func die():
	emit_signal("died")
	dead = true
	self.superhero_mode = false

func move_left():
	if input_vector.x > 0:
		input_vector.x = 0
	else: input_vector.x = -1

func move_right():
	if input_vector.x < 0:
		input_vector.x = 0
	else: input_vector.x = 1

func move_up():
	var colliders = get_colliding_bodies()
	if colliders.has(Shortcuts.bottom_wall):
#	if colliders.size() > 0 and colliders[0].get_parent().name == "Walls":
		input_vector.y = -1
	else: input_vector.y = 0

func move_down():
	pass

func stop_moving():
	input_vector = Vector2()

func _integrate_forces(state):
	apply_impulse(Vector2(), input_vector * speed)
	if abs(linear_velocity.x) > speed:
		linear_velocity.x = speed * sign(linear_velocity.x)
	
	if input_vector.x < 0:
		state.angular_velocity = -PI * 2
	elif input_vector.x > 0:
		state.angular_velocity = PI * 2
	
	if input_vector.y < 0:
		var vertical = input_vector
		vertical.x = 0
		apply_impulse(Vector2(), vertical * jump_force)