extends Node

signal on
signal off

export(int) var normal_speed = 100
export(int) var super_speed = 500

export(int) var normal_jump_force = 800
export(int) var super_jump_force = 1500
export(float) var super_time_scale = 0.2

export(bool) var superhero_mode = false

func toggle():
	self.superhero_mode = not superhero_mode
	if superhero_mode:
		on()
	else: off()

func on():
	var hero = Shortcuts.hero
	
	self.superhero_mode = true
	hero.speed = super_speed
	hero.jump_force = super_speed
	Engine.time_scale = super_time_scale
	
	emit_signal("on")

func off():
	var hero = Shortcuts.hero
	
	self.superhero_mode = false
	hero.speed = normal_speed
	hero.jump_force = normal_jump_force
	Engine.time_scale = 1
	
	emit_signal("off")