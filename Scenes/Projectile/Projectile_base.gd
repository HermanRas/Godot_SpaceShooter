extends Area2D

var SPEED = -200
var DAMAGE = 10
var CAN_DIE = true
var _err = ''
var DamageText = preload("res://Scenes/Projectile/DamageIndecator/Damage.tscn")

func _ready():
	self.add_to_group("Projectile")
	_err = connect("area_entered",self, "_on_area_entered")
	_err = connect("body_entered",self, "_on_body_entered")
	
func _physics_process(delta):
	position += transform.y * SPEED * delta
	
	if global_position.y < 0 :
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("Enemy"):
		var DamageTextTscn = DamageText.instance()
		DamageTextTscn.text = str(DAMAGE)
		area.add_child(DamageTextTscn)
		
		
		area.HEALTH = area.HEALTH - DAMAGE
		$Audio_Impact.play()
		if CAN_DIE :
			$TextureRect.visible = false
			.set_collision_layer(2)
			.set_collision_mask(2)


func _on_Audio_Impact_finished():
	if CAN_DIE :
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("Projectile"):
		pass

func set_SPEED(speed):
	SPEED = speed

func set_DAMAGE(damage):
	DAMAGE = damage
