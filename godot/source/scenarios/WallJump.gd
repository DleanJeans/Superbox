extends "res://source/scenarios/Scenario.gd"

func _init():
	scenario_name = "Wall Jump!"
	level_scene = Shortcuts.ScenarioWallJump

func setup():
	Shortcuts.arrow_shooter.advanced = false
	Shortcuts.arrow_shooter.amount = 15