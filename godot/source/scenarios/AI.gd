extends "res://source/scenarios/Scenario.gd"

func _init():
	scenario_name = "AI = Arrows Intelligent"

func setup():
	Shortcuts.arrow_shooter.advanced = true
	Shortcuts.arrow_shooter.amount = 20