extends Node

var ArrowScene = load("res://source/world/Arrow.tscn")

var game setget , get_game
func get_game():
	return $"/root/Game"

var world setget , get_world
func get_world():
	return $"/root/Game/World"

var mechanics setget , get_mechanics
func get_mechanics():
	return $"/root/Game/Mechanics"

var ui setget , get_ui
func get_ui():
	return $"/root/Game/UI"

var hero setget , get_hero
func get_hero():
	return $"/root/Game/World/Hero"

var bottom_wall setget , get_bottom_wall
func get_bottom_wall():
	return $"/root/Game/World/Walls/Bottom"

var arrow_shooter setget , get_arrow_shooter
func get_arrow_shooter():
	return $"/root/Game/Mechanics/ArrowShooter"

var superhero_mode setget , get_superhero_mode
func get_superhero_mode():
	return $"/root/Game/Mechanics/SuperheroMode"

var scenario_screen setget , get_scenario_screen
func get_scenario_screen():
	return $"/root/Game/UI/ScenarioScreen"

var restarter setget , get_restarter
func get_restarter():
	return $"/root/Game/Mechanics/Restarter"

#var name setget , get_name
#func get_name():
#	return $"/root/Game/"

var thank_you_screen setget , get_thanks_screen
func get_thanks_screen():
	return $"/root/Game/UI/ThankYouScreen"