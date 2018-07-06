extends Node

var ScenarioFloorOnly = "res://source/world/levels/ScenarioFloorOnly.tscn"
var ScenarioWallJump = "res://source/world/levels/ScenarioWallJump.tscn"

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

var level setget , get_level
func get_level():
	return $"/root/Game/World/Level"

var level_floor setget , get_level_floor
func get_level_floor():
	return $"/root/Game/World/Level/Floor"

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

var thank_you_screen setget , get_thanks_screen
func get_thanks_screen():
	return $"/root/Game/UI/ThankYouScreen"

var trail setget , get_trail
func get_trail():
	return $"/root/Game/Juice/Trail"

var death_animation setget , get_death_animation
func get_death_animation():
	return $"/root/Game/Juice/DeathAnimation"

#var name setget , get_name
#func get_name():
#	return $"/root/Game/"