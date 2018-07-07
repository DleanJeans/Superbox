extends Node

signal new_level_loaded

var scenario_files = ["Arrows", "WallJump", "MoreArrows", "AI", "WallJumpAI"]
var scenarios = []

var screen setget , get_screen
func get_screen():
	return Shortcuts.scenario_screen

func _ready():
	_add_scenarios()
	_play_scenarios()

func _add_scenarios():
	for s in scenario_files:
		var index = scenarios.find(s)
		s = "res://source/scenarios/%s.gd" % s
		scenarios.append(load(s).new())

func _play_scenarios():
	var i = GameData.scenario
	while i < scenarios.size():
		yield(_play_current_scenario(), "completed")
		i += 1
		GameData.scenario = i
	Shortcuts.thank_you_screen.scroll_in()

func _play_current_scenario():
	var scenario = scenarios[GameData.scenario]
	var num = scenarios.find(scenario) + 1
	_setup_screen(num, scenario.scenario_name)
	_change_scenario_scene(scenario.level_scene)
	scenario.setup()
	
	Shortcuts.superhero_mode.allow_to_turn = true
	
	yield(_end_if_hero_survives(), "completed")

func _end_if_hero_survives():
	while true:
		print("Scenario %s: Waiting for the last arrow" % (GameData.scenario + 1))
		yield(Shortcuts.arrow_shooter, "last_arrow")
		print("Scenario %s: Waiting for 2 sec after the last arrow" % (GameData.scenario + 1))
		yield(get_tree().create_timer(2), "timeout")
		
		if not Shortcuts.hero.dead:
			break;
	
	Shortcuts.superhero_mode.allow_to_turn = false

func _setup_screen(number, name):
	self.screen.setup(number, name)
	self.screen.scroll()

func _change_scenario_scene(scene_name):
	yield(Shortcuts.scenario_screen, "scrolled_down")
	
	var level = Shortcuts.level
	
	if level != null and level.filename != scene_name:
		level.free()
		
		var new_scene = load(scene_name).instance()
		Shortcuts.world.add_child(new_scene)
		new_scene.raise()
	emit_signal("new_level_loaded")