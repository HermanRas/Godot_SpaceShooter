extends "res://Scenes/Drops/Drop_Base.gd"

var nukeTscn = preload("res://Scenes/Projectile/Nuke.tscn")

func _on_area_entered(area):
	if area.name == "Shield":
		dropNuke()

	if area.name == "Ship":
		dropNuke()

func dropNuke():
	var nuke = nukeTscn.instance()
	nuke.position = self.global_position
	self.get_parent().get_parent().add_child(nuke)
	queue_free() #remove the drop
