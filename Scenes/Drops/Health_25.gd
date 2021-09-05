extends "res://Scenes/Drops/Drop_Base.gd"

var HEALTH_UP = 25

func _on_area_entered(area):
	if area.name == "Shield":
		area.get_parent().HEALTH = area.get_parent().HEALTH + HEALTH_UP
		queue_free() #remove the drop


	if area.name == "Ship":
		area.get_parent().HEALTH = area.get_parent().HEALTH + HEALTH_UP
		queue_free() #remove the drop
