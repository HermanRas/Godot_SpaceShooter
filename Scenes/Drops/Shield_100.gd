extends "res://Scenes/Drops/Drop_Base.gd"

var SHIELD_UP = 100

func _on_area_entered(area):
	if area.name == "Shield":
		area.get_parent().SHIELD = area.get_parent().SHIELD + SHIELD_UP
		queue_free() #remove the drop


	if area.name == "Ship":
		area.get_parent().SHIELD = area.get_parent().SHIELD + SHIELD_UP
		queue_free() #remove the drop
