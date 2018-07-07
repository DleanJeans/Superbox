extends "res://source/scenarios/Scenario.gd"

func _init():
	scenario_name = "Wall Jump + AI"
	level_scene = Shortcuts.ScenarioWallJump

func setup():
	Shortcuts.arrow_shooter.advanced = true
	Shortcuts.arrow_shooter.amount = 20