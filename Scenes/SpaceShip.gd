extends Node2D

var SPEED = 4
var HEALTH = 100
var SHIELD = 150
var FLY_TO = Vector2()

var FIRE_SPEED = 0.2 #seconds
var FIRE_MULTIPLYER = 1
var FIRE_LEFT_MULTIPLYER = 5
var FIRE_RIGHT_MULTIPLYER = 5

var FIRE = true
var FIRE_LEFT = false
var FIRE_RIGHT = false

var _err = ''

const LaserSm = preload("res://Scenes/Projectile/LaserSm.tscn")
const LaserLg = preload("res://Scenes/Projectile/LaserLg.tscn")

var GUN = LaserSm
var GUN_RIGHT = LaserSm
var GUN_LEFT = LaserSm

func _ready():
	FLY_TO = self.global_position
	self.add_to_group("Player")
	set_fire(FIRE)
	set_fire_left(FIRE_LEFT)
	set_fire_right(FIRE_RIGHT)

func _process(_delta):
		#process movement
		if (
			((FLY_TO.x - self.global_position.x) > SPEED )||
			((FLY_TO.y - self.global_position.y) > SPEED )||
			((FLY_TO.x - self.global_position.x) < -SPEED)||
			((FLY_TO.y - self.global_position.y) < -SPEED )
		):
			var move_speed = Vector2(SPEED,SPEED)
			var direction = (FLY_TO - self.global_position).normalized()
			self.position = position + direction * move_speed
	
		#print("shield: "+str(SHIELD)+" health: "+str(HEALTH))
		set_shield(SHIELD)
		if HEALTH <= 0 :
			queue_free()
			var end = preload("res://Scenes/Menu/Death.tscn")
			_err = get_tree().change_scene_to(end)

func _unhandled_input(event):
	#move to mouse click
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				FLY_TO = event.position

func set_fire(state):
	if state :
		$FireFront.show()
		$FireFront.play()
		$FireFront/TimerFireFront.start()
		$FireFront/TimerFireFront.wait_time = FIRE_SPEED * FIRE_MULTIPLYER
	else : 
		$FireFront.hide()
		$FireFront.stop()
		$FireFront/TimerFireFront.stop()

func set_fire_left(state):
	if state :
		$FireLeft.show()
		$FireLeft.play()
		$FireLeft/TimerFireLeft.start()
		$FireLeft/TimerFireLeft.wait_time = FIRE_SPEED * FIRE_LEFT_MULTIPLYER
	else :
		$FireLeft.hide()
		$FireLeft.stop()
		$FireLeft/TimerFireLeft.stop()

func set_fire_right(state):
	if state :
		$FireRight.show()
		$FireRight.play()
		$FireRight/TimerFireRight.start()
		$FireRight/TimerFireRight.wait_time = FIRE_SPEED * FIRE_RIGHT_MULTIPLYER
	else : 
		$FireRight.hide()
		$FireRight.stop()
		$FireRight/TimerFireRight.stop()

func set_shield(shield):
	if shield > 0 :
		$Shield.show()
		if !$Shield/AudioShield.playing :
			$Shield/AudioShield.play()
	else :
		$Shield.hide()
		$Shield/AudioShield.stop()

func _on_TimerFireFront():
	var FrontLaser = GUN.instance()
	FrontLaser.position = self.global_position
	self.get_parent().add_child(FrontLaser)

func _on_TimerFireLeft():
	var LeftLaser = GUN_LEFT.instance()
	LeftLaser.position = self.global_position
	LeftLaser.position.x = LeftLaser.position.x - 20
	LeftLaser.rotation = $FireLeft.rotation
	self.get_parent().add_child(LeftLaser)

func _on_TimerFireRight():
	var RightLaser = GUN_RIGHT.instance()
	RightLaser.position = self.global_position
	RightLaser.position.x = RightLaser.position.x + 20
	RightLaser.rotation = $FireRight.rotation
	self.get_parent().add_child(RightLaser)


func _on_UpdateStatus_timeout():
	set_fire(FIRE)
	set_fire_left(FIRE_LEFT)
	set_fire_right(FIRE_RIGHT)
