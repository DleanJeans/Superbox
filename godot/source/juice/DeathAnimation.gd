extends Node2D

func _ready():
	Shortcuts.hero.connect("hit_by_arrow", self, "play")

func play(arrow):
	show()
	
	var hero = Shortcuts.hero
	
	hero.hide()
	hero.mode = RigidBody2D.MODE_STATIC
	position = hero.position
	$DeathParticle.restart()
	$DeathParticle2.restart()
	
	rotation = arrow.velocity.angle_to_point(Vector2()) - PI / 2