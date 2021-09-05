extends "res://Scenes/Drops/Drop_Base.gd"

var SPEED_UP = 10

func _on_area_entered(area):
	if area.name == "Shield":
		area.get_parent().SPEED = area.get_parent().SPEED + SPEED_UP
		queue_free() #remove the drop


	if area.name == "Ship":
		area.get_parent().SPEED = area.get_parent().SPEED + SPEED_UP
		queue_free() #remove the drop
