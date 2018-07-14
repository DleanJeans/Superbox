extends Node

onready var slo_mo = Shortcuts.slo_mo
var slo_mo_before_pause

func _ready():
	var pause_scene = Shortcuts.pause_scene
	pause_scene.connect('paused', self, '_pause_slo_mo')
	pause_scene.connect('unpausing', self, '_unpause_slo_mo')

func _pause_slo_mo():
	slo_mo_before_pause = slo_mo.is_on
	slo_mo.off()

func _unpause_slo_mo():
	if slo_mo_before_pause:
		slo_mo.on()