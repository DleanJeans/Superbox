extends Node

func _ready():
	Shortcuts.slo_mo.connect("on", Music, "play_slo_mo")
	Shortcuts.slo_mo.connect("off", Music, "play_normal")