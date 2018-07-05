extends RigidBody2D

signal died
signal hit_by_arrow(arrow)

export(int) var speed = 100
export(int) var jump_force = 800

var input_vector = Vector2()
var dead = false

func hit_by_arrow(arrow):
	if dead: return
	
	emit_signal("hit_by_arrow", arrow)
	die()

func die():
	emit_signal("died")
	dead = true
	Shortcuts.superhero_mode.off()

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