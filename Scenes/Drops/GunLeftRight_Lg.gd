extends "res://Scenes/Drops/Drop_Base.gd"

var FIRE = true

func _on_area_entered(area):	
	if area.name == "Shield":
		area.get_parent().GUN_LEFT = LaserLg
		area.get_parent().FIRE_LEFT_MULTIPLYER  = 5
		area.get_parent().GUN_RIGHT = LaserLg
		area.get_parent().FIRE_RIGHT_MULTIPLYER  = 5
		queue_free() #remove the drop

	if area.name == "Ship":
		area.get_parent().GUN_RIGHT = LaserLg
		area.get_parent().FIRE_RIGHT_MULTIPLYER  = 5
		area.get_parent().GUN_LEFT = LaserLg
		area.get_parent().FIRE_LEFT_MULTIPLYER  = 5

		queue_free() #remove the drop
