extends Node

onready var wall = $"../Wall"

func _process(delta):
	var wall_to_hero_x = Shortcuts.hero.position.x - wall.position.x
	var wall_to_shooter_x = Shortcuts.arrow_shooter.position.x - wall.position.x
	
	var hero_side = sign(wall_to_hero_x)
	var shooter_side = sign(wall_to_shooter_x)
	
	if hero_side != shooter_side:
		Shortcuts.arrow_shooter.position.x = wall.position.x - wall_to_shooter_x