extends KinematicBody2D

signal hit

export(int) var speed = 100

var velocity = Vector2()
var updating_rotation = true
var kinematic_collision

func shoot(target_position):
	var vector_to_target = target_position - position
	velocity = vector_to_target.normalized() * speed

func _physics_process(delta):
	kinematic_collision = move_and_collide(velocity * delta)
	update_rotation()
	_stick_if_hit()

func update_rotation():
	if updating_rotation:
		rotation = velocity.angle_to_point(Vector2())

func _stick_if_hit():
	if updating_rotation and kinematic_collision != null:
		updating_rotation = false
		set_physics_process(false)
		
		var collider = kinematic_collision.collider
		if collider == null:
			queue_free()
		if collider == Shortcuts.hero:
			Shortcuts.hero.die()
		collision_mask = 0
		collision_layer = 0
		
		emit_signal("hit")