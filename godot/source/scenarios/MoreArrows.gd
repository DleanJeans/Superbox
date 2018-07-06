extends "res://source/scenarios/Scenario.gd"

func _init():
	scenario_name = "More Arrows!!!"

func setup():
	Shortcuts.arrow_shooter.advanced = false
	Shortcuts.arrow_shooter.amount = 30