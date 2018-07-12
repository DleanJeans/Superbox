extends Node

func _ready():
	Shortcuts.slo_mo.connect("on", Music, "play_slo_mo")
	Shortcuts.slo_mo.connect("off", Music, "play_normal")

func mute():
	AudioServer.set_bus_mute(0, true)
	Music.pause()

func unmute():
	AudioServer.set_bus_mute(0, false)
	Music.resume()