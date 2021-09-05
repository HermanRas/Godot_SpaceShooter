extends Node2D
var SPEED = 5
var out_of_bounds = ProjectSettings.get_setting("display/window/size/height")

func _physics_process(delta):
	set_position(Vector2(160,get_position().y + SPEED))
	if get_position().y > out_of_bounds :
		queue_free()

func set_Level(level) : 
	$Lable.text = level
