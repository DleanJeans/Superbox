extends Node

export(float) var slo_mo_time_scale = 0.2

func on():
	Engine.time_scale = slo_mo_time_scale

func off():
	Engine.time_scale = 1