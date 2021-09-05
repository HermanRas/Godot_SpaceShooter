extends "res://Scenes/Enemy/Enemy_base.gd"

var DIRECTION = -10

func _ready():
	set_HEALTH(200)
	set_SPEED(20)
	$Truster2D.LEANGTH = 300
	DIRECTION = (randi() % 20) -10
	$TextureRect.rotation_degrees = (DIRECTION * -1) * 2

func _physics_process(delta):
	if position.x < 30 && DIRECTION < 0 :
		DIRECTION = DIRECTION * -1
		$TextureRect.rotation_degrees = (DIRECTION * -1) * 2
		set_move_to(DIRECTION * delta,0)

	elif position.x > 384  && DIRECTION > 0 :
		DIRECTION = DIRECTION * -1
		$TextureRect.rotation_degrees = (DIRECTION * -1) * 2
		set_move_to(DIRECTION * delta,0)
	else :
		set_move_to(DIRECTION * delta,0)
