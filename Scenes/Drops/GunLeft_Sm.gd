extends "res://Scenes/Drops/Drop_Base.gd"

var FIRE = true

func _on_area_entered(area):
	if area.name == "Shield":
		area.get_parent().FIRE_LEFT = FIRE
		area.get_parent().GUN_LEFT = LaserSm
		area.get_parent().FIRE_LEFT_MULTIPLYER  = 1
		queue_free() #remove the drop

	if area.name == "Ship":
		area.get_parent().FIRE_LEFT = FIRE
		area.get_parent().GUN_LEFT = LaserSm
		area.get_parent().FIRE_LEFT_MULTIPLYER  = 1
		queue_free() #remove the drop
