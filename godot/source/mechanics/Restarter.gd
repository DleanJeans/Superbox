extends Node

var hero_initial_position

func restart():
	Shortcuts.scenario_screen.scroll()
	
	yield(Shortcuts.scenario_screen, "scrolled_down")
	
	Shortcuts.arrow_shooter.free_all_arrows()
	Shortcuts.trail.reset()
	Shortcuts.death_animation.hide()
	
	var hero = Shortcuts.hero
	hero.position = hero_initial_position
	hero.rotation = 0
	hero.mode = RigidBody2D.MODE_RIGID
	hero.show()
	hero.revive()

func record_hero_initial_position():
	hero_initial_position = Shortcuts.hero.position