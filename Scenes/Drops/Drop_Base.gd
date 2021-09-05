extends Area2D

#this object
var SPEED = 50
const LaserSm = preload("res://Scenes/Projectile/LaserSm.tscn")
const LaserLg = preload("res://Scenes/Projectile/LaserLg.tscn")

var _err = ''
var out_of_bounds = ProjectSettings.get_setting("display/window/size/height")

func _ready():
	_err = connect("area_entered",self, "_on_area_entered")
	_err = connect("body_entered",self, "_on_body_entered")

func _physics_process(delta):
	$TextureRect.rotation += PI * delta
	position += transform.y * SPEED * delta
	
	if position.x > out_of_bounds :
		queue_free()

func set_SPEED(speed):
	SPEED = speed

func _on_area_entered(area):
	if area.name == "Shield":
		queue_free() #remove the drop

	if area.name == "Ship":
		queue_free() #remove the drop
