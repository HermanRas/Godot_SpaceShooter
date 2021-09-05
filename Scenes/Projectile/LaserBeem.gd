extends "res://Scenes/Projectile/Projectile_base.gd"

var TTL = 5

func _ready():
	CAN_DIE = false
	set_SPEED(0)
	set_DAMAGE(200)
	$"TTL-Timer".wait_time = TTL
	$"TTL-Timer".start()
#
func _on_TTLTimer_timeout():
	queue_free()
	pass
