extends Node2D

signal started_shooting
signal stopped_shooting
signal last_arrow
signal shot_arrow

export(bool) var advanced = false
export(int) var amount = 30
export(float) var interval = 0.1

var arrows_left
var last_arrow

func _ready():
	connect_superhero_mode()

func connect_superhero_mode():
	Shortcuts.superhero_mode.connect("on", self, "start_shooting")

func free_all_arrows():
	for arrow in get_tree().get_nodes_in_group("Arrows"):
		arrow.queue_free()

func start_shooting():
	$Timer.wait_time = interval
	arrows_left = amount
	$Timer.start()
	
	emit_signal("started_shooting")

func stop_shooting():
	$Timer.stop()
	emit_signal("stopped_shooting")

func _shoot_arrow():
	last_arrow = Shortcuts.ArrowScene.instance()
	var target_position = compute_target_position(last_arrow)
	
	Shortcuts.world.add_child(last_arrow)
	last_arrow.position = position
	last_arrow.shoot(target_position)
	last_arrow.update_rotation()
	
	emit_signal("shot_arrow")

func compute_target_position(arrow):
	var hero = Shortcuts.hero
	var hero_position = hero.position
	
	if arrows_left % 2 == 1 or not advanced:
		return hero_position
	
	var hero_velocity = hero.linear_velocity
	var vector_to_hero = hero_position - position 
	var distance = vector_to_hero.distance_to(Vector2())
	var time_to_hit_hero = distance / arrow.speed
	
	var target_position = hero_position + hero_velocity * time_to_hit_hero
	
	return target_position

func _stop_if_out_of_arrows():
	arrows_left -= 1
	if arrows_left <= 0:
		stop_shooting()
		last_arrow.connect("got_disabled", self, "_emit_last_arrow")

func _emit_last_arrow():
	emit_signal("last_arrow")

func _update_and_show_arrow_counter():
	_update_arrow_counter()
	$ArrowCounter.show()

func _update_arrow_counter():
	$ArrowCounter.text = str(arrows_left)
	if arrows_left == 0:
		$ArrowCounter.hide()