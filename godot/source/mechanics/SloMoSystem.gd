extends Node

signal on
signal off

export(float) var slo_mo_time_scale = 0.2

var is_on = false

func on():
	is_on = true
	Engine.time_scale = slo_mo_time_scale
	emit_signal("on")

func off():
	is_on = false
	Engine.time_scale = 1
	emit_signal("off")