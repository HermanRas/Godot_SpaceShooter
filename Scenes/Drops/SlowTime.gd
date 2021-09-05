extends "res://Scenes/Drops/Drop_Base.gd"
var timer = Timer.new()
	
func _on_area_entered(area):
	if area.name == "Shield":
		StartSlowTime()

	if area.name == "Ship":
		StartSlowTime()

func StartSlowTime() : 
	Engine.set_time_scale(0.5)
	Global.set_GameMusicSpeed(0.5)
	
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.wait_time = 5
	add_child(timer)
	timer.start()
	
	SPEED = 0
	
	$CollisionShape2D.queue_free()
	$base.visible = false
	$icon.visible = false
	
	
func _on_timer_timeout():
	Engine.set_time_scale(1.0)
	Global.set_GameMusicSpeed(1)

	queue_free()
