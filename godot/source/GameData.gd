extends Node

var scenario = 0
var attempts = 1

func reset():
	scenario = 0
	attempts = 1

func increase_attempts():
	attempts += 1

func _ready():
	get_tree().connect("node_added", self, "_increase_attempts_when_hero_dies")

func _increase_attempts_when_hero_dies(node):
	if node.name == "Game":
		Shortcuts.hero.connect("died", self, "increase_attempts")