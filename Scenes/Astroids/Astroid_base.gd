extends Area2D

var HEALTH = 800
var SPEED = 90
var DAMAGE = 1000

var _err = ''
var out_of_bounds = int(ProjectSettings.get_setting("display/window/size/height")) + 200

func _ready():
	self.add_to_group("Enemy")
	_err = connect("area_entered",self, "_on_area_entered")
	_err = connect("body_entered",self, "_on_body_entered")

func _physics_process(delta):
	position += transform.y * SPEED * delta
	$TextureRect.rotation += PI * delta
	if position.y > out_of_bounds :
		queue_free()
	if HEALTH < 0:
		queue_free()

func set_HEALTH(health):
	HEALTH = health

func set_SPEED(speed):
	SPEED = speed

func _on_area_entered(area):
	if area.name == "Shield":
		if area.get_parent().SHIELD > 0:
			if area.get_parent().SHIELD >= DAMAGE:
				area.get_parent().SHIELD = area.get_parent().SHIELD - DAMAGE
				queue_free() #remove the enamy
			else:
				DAMAGE = DAMAGE - area.get_parent().SHIELD
				area.get_parent().SHIELD = 0

	if area.name == "Ship":
		area.get_parent().HEALTH = area.get_parent().HEALTH - DAMAGE
		queue_free() #remove the enamy
