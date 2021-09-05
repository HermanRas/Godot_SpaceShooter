extends "res://Scenes/Projectile/Projectile_base.gd"

var TTL = 5

func _ready():
	CAN_DIE = false
	set_SPEED(-20)
	set_DAMAGE(20000)
	$"TTL-Timer".wait_time = TTL
	$"TTL-Timer".start()
#
func _on_TTLTimer_timeout():
	$Audio_Impact.play()
	$CollisionShape2D.scale = Vector2(50,50)
	CAN_DIE = true
