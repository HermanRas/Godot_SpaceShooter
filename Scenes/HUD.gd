extends Control

func _on_Timer_timeout():
	var spaceship  = self.get_parent().find_node("SpaceShip")
	if spaceship :
		$ShipStats/Health/Label.text = str(spaceship.HEALTH)
		$ShipStats/Shield/Label.text = str(spaceship.SHIELD)
		$ShipStats/Speed/Label.text = str(spaceship.SPEED)
		$ShipStats/Score/Label.text = str(Global.SCORE)
