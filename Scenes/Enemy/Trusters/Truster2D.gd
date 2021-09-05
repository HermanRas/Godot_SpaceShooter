extends Line2D

export var LEANGTH = 50
var point = Vector2()

func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	if get_point_count() > 0 :
		point = Vector2(point.x - 5 + (randi() %10), point.y)

	add_point(point)

	while get_point_count() > LEANGTH :
		remove_point(0)
