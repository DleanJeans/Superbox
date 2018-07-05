extends Node

var scenarios = []

var screen setget , get_screen
func get_screen():
	return Shortcuts.scenario_screen

func _ready():
	scenarios.append(funcref(self, "start_scenario_1"))
	scenarios.append(funcref(self, "start_scenario_2"))
	
	scenarios[GameData.scenario - 1].call_func()

func start_scenario_1():
	_setup_screen(1, "Arrows")
	yield(Shortcuts.arrow_shooter, "last_arrow_hit")
	while Shortcuts.hero.dead:
		yield(Shortcuts.arrow_shooter, "last_arrow_hit")
	
	yield(get_tree().create_timer(1), "timeout")
	start_scenario_2()

func start_scenario_2():
	GameData.scenario = 2
	_setup_screen(2, "More Arrows!!!")
	Shortcuts.arrow_shooter.free_all_arrows()
	Shortcuts.arrow_shooter.advanced = true
#	Shortcuts.arrow_shooter.connect_superhero_mode()

func _setup_screen(number, name):
	self.screen.setup(number, name)
	self.screen.scroll()