extends Area2D

#this object
var flash = 0
var SPEED = 50
const LaserSm = preload("res://Scenes/Projectile/LaserSm.tscn")
const LaserLg = preload("res://Scenes/Projectile/LaserLg.tscn")

var _err = ''
var out_of_bounds = ProjectSettings.get_setting("display/window/size/height")

func _ready():
	flash = 1
	_err = connect("area_entered",self, "_on_area_entered")
	_err = connect("body_entered",self, "_on_body_entered")

func _physics_process(delta):
	position += transform.y * SPEED * delta
	
	if	flash > 5000 :
		flash = 1
		self.get_child(1).flip_h = !self.get_child(1).flip_h
		self.get_child(1).flip_v = !self.get_child(1).flip_v
	else:
		flash += 200

	if position.x > out_of_bounds :
		queue_free()

func set_SPEED(speed):
	SPEED = speed

func _on_area_entered(area):
	if area.name == "Shield":
		queue_free() #remove the drop

	if area.name == "Ship":
		queue_free() #remove the drop
