extends KinematicBody2D

signal got_disabled

export(int) var speed = 100

var velocity = Vector2()
var kinematic_collision

var disabled = false
var flew_by = false

func shoot(target_position):
	var vector_to_target = target_position - position
	velocity = vector_to_target.normalized() * speed

func _physics_process(delta):
	kinematic_collision = move_and_collide(velocity * delta)
	_process_collision()

func update_rotation():
	rotation = velocity.angle_to_point(Vector2())

func _process_collision():
	if kinematic_collision == null: return
	
	var collider = kinematic_collision.collider
	
	if collider == Shortcuts.hero:
		Shortcuts.hero.hit_by_arrow(self)
	else:
		set_physics_process(false)
		_disable_collision()
	
	_disable_hero_collision()
	_disable()

func _disable_collision():
	collision_mask = 0

func _disable_hero_collision():
	collision_mask = 2

func _disable():
	if disabled: return
	
	disabled = true
	emit_signal("got_disabled")

func _on_SoundArea_body_entered(body):
	$HitSound.play()

func _on_FlybySoundArea_body_entered(body):
	if flew_by: return
	
	flew_by = true
	$FlybySound.play()
