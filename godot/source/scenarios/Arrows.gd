extends "res://source/scenarios/Scenario.gd"

func _init():
	scenario_name = "Arrows!"

func setup():
	Shortcuts.arrow_shooter.advanced = false
	Shortcuts.arrow_shooter.amount = 10