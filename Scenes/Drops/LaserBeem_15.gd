extends "res://Scenes/Drops/Drop_Base.gd"

var LaserBeem = preload("res://Scenes/Projectile/LaserBeem.tscn")

func _on_area_entered(area):
	if area.name == "Shield":
		var newBeem = LaserBeem.instance()
		newBeem.position.y = -20
		newBeem.TTL = 15
		area.get_parent().add_child(newBeem)
		queue_free() #remove the drop

	if area.name == "Ship":
		var newBeem = LaserBeem.instance()
		newBeem.position.y = -20
		newBeem.TTL = 15
		area.get_parent().add_child(newBeem)
		queue_free() #remove the drop
