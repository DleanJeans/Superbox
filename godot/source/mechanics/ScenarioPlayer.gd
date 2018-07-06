extends Node

var scenarios = []

var screen setget , get_screen
func get_screen():
	return Shortcuts.scenario_screen

func _ready():
	_add_scenario_functions()
	_play_current_scenario()

func _add_scenario_functions():
	var string_format = "start_scenario_%s"
	var num = 1
	var func_name = string_format % num
	
	while has_method(func_name):
		scenarios.append(funcref(self, func_name))
		num += 1
		func_name = string_format % num

func _play_current_scenario():
	scenarios[GameData.scenario].call_func()
	Shortcuts.superhero_mode.allow_to_turn = true

func _start_next_scenario_if_hero_survives():
	while true:
		yield(Shortcuts.arrow_shooter, "last_arrow")
		yield(get_tree().create_timer(2), "timeout")
		
		if not Shortcuts.hero.dead:
			break;

	Shortcuts.superhero_mode.allow_to_turn = false
	_start_next_scenario()

func _start_next_scenario():
	GameData.scenario += 1
	if _out_of_scenarios():
		Shortcuts.thank_you_screen.scroll_in()
		return
	_play_current_scenario()

func start_scenario_1():
	_setup_screen(1, "Arrows")
	_start_next_scenario_if_hero_survives()

func start_scenario_2():
	_setup_screen(2, "More Arrows!!!")
	Shortcuts.arrow_shooter.amount = 30
	
	_start_next_scenario_if_hero_survives()

func start_scenario_3():
	_setup_screen(3, "AI = Arrows Intelligent!")
	Shortcuts.arrow_shooter.advanced = true
	Shortcuts.arrow_shooter.amount = 20
	
	_start_next_scenario_if_hero_survives()

func _out_of_scenarios():
	return GameData.scenario >= scenarios.size()

func _setup_screen(number, name):
	self.screen.setup(number, name)
	self.screen.scroll()