extends Area2D

var HEALTH = 100
var SPEED = 50
var DAMAGE = 100

var _err = ''
var explosion = preload("res://Scenes/Enemy/Explosion/Explode.tscn").instance()
var out_of_bounds = int(ProjectSettings.get_setting("display/window/size/height")) + 200

func _ready():
	self.add_to_group("Enemy")
	_err = connect("area_entered",self, "_on_area_entered")
	_err = connect("body_entered",self, "_on_body_entered")

func _physics_process(delta):
	set_move_to(0,SPEED * delta)
	if position.y > out_of_bounds :
		queue_free()
	if HEALTH < 0:
		Global.SCORE = Global.SCORE + 1
		explosion.position = position
		get_parent().add_child(explosion)
		queue_free()
		
func set_move_to(position_x,position_y):
	position += transform.y * position_y 
	position += transform.x * position_x 

func set_HEALTH(health):
	HEALTH = health

func set_SPEED(speed):
	SPEED = speed

func _on_area_entered(area):
	if area.name == "Shield":
		if area.get_parent().SHIELD > 0:
			if area.get_parent().SHIELD >= DAMAGE:
				area.get_parent().SHIELD = area.get_parent().SHIELD - DAMAGE
			else:
				DAMAGE = DAMAGE - area.get_parent().SHIELD
				area.get_parent().SHIELD = 0

	if area.name == "Ship":
		area.get_parent().HEALTH = area.get_parent().HEALTH - DAMAGE
		queue_free() #remove the enamy
