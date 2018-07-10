extends Node

var normal_playback_position = 0
var slomo_playback_position = 0

func play_normal():
	_update_normal_playback_position($Normal.get_playback_position())
	$SloMo.stop()
	$Normal.play(normal_playback_position)

func play_slo_mo():
	_update_slomo_playback_position($SloMo.get_playback_position())
	$Normal.stop()
	$SloMo.play(slomo_playback_position)

func _update_normal_playback_position(position):
	normal_playback_position = position
	slomo_playback_position = position * 5

func _update_slomo_playback_position(position):
	slomo_playback_position = position
	normal_playback_position = position * 0.2