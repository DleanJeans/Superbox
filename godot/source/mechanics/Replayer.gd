extends Node

signal started_recording
signal stopped_recording
signal started_replaying
signal stopped_replaying

var recording = false
var replaying = false

var hero_positions
var hero_rotations

var current_frame

var arrows_started_frame

func connect_arrow_shooter():
	Shortcuts.arrow_shooter.connect("started_shooting", self, "_record_arrows_started_frame")

func _record_arrows_started_frame():
	arrows_started_frame = current_frame

func start_recording():
	current_frame = 0
	recording = true
	
	hero_positions = []
	hero_rotations = []
	
	emit_signal("started_recording")

func stop_recording():
	recording = false
	emit_signal("stopped_recording")

func start_replaying():
	stop_recording()
	
	current_frame = 0
	replaying = true
	
	Shortcuts.hero.mode = RigidBody2D.MODE_STATIC
	
	emit_signal("started_replaying")

func stop_replaying():
	replaying = false
	emit_signal("stopped_replaying")

func _physics_process(delta):
	if recording:
		_record()
	elif replaying:
		_replay()

func _record():
	hero_positions.append(Shortcuts.hero.position)
	hero_rotations.append(Shortcuts.hero.rotation)
	current_frame += 1

func _replay():
	Shortcuts.hero.position = hero_positions[current_frame]
	Shortcuts.hero.rotation = hero_rotations[current_frame]
	
	current_frame += 1
	var out_of_current_frames = current_frame >= hero_positions.size()
	if out_of_current_frames:
		stop_replaying()
	
	if current_frame == arrows_started_frame:
		Shortcuts.arrow_shooter.start_shooting()