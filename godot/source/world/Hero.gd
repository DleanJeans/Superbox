extends RigidBody2D

signal died
signal revived
signal hit_by_arrow(arrow)

export(int) var speed = 100
export(int) var jump_force = 800

var input_vector = Vector2()
var dead = false

func hit_by_arrow(arrow):
	if dead: return
	
	die()
	emit_signal("hit_by_arrow", arrow)

func die():
	if dead: return
	
	dead = true
	emit_signal("died")

func revive():
	dead = false
	
	emit_signal("revived")

func move_left():
	if input_vector.x > 0:
		input_vector.x = 0
	else: input_vector.x = -1

func move_right():
	if input_vector.x < 0:
		input_vector.x = 0
	else: input_vector.x = 1

func move_up():
	$MoveUp.call()

func move_down():
	input_vector.y = 1

func stop_moving():
	input_vector = Vector2()

func _on_JumpTimer_timeout():
	input_vector.y = 0

func _integrate_forces(state):
	$IntegrateForces.call(state)

func _physics_process(delta):
	if position.y > OS.window_size.y:
		die()