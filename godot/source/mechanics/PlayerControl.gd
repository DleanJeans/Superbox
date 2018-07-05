extends Node

func _physics_process(delta):
	var hero = Shortcuts.hero
	
	if Input.is_action_pressed("move_left"):
		hero.move_left()
	if Input.is_action_pressed("move_right"):
		hero.move_right()
	if Input.is_action_just_pressed("move_up"):
		hero.move_up()
	if Input.is_action_pressed("move_down"):
		hero.move_down()
	if Input.is_action_just_pressed("action"):
		Shortcuts.superhero_mode.on()
	
	if Input.is_action_just_released("move_left"):
		hero.stop_moving()
	if Input.is_action_just_released("move_right"):
		hero.stop_moving()
	if Input.is_action_just_released("move_up"):
		hero.stop_moving()
	if Input.is_action_just_released("move_down"):
		hero.stop_moving()