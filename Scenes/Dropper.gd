extends Node

var DROPS_MAP =  {
	'Health_25':preload( "res://Scenes/Drops/Health_25.tscn"),
	'Health_50':preload( "res://Scenes/Drops/Health_50.tscn"),
	'Health_100':preload( "res://Scenes/Drops/Health_100.tscn"),
	'Shield_25':preload("res://Scenes/Drops/Shield_25.tscn"),
	'Shield_50':preload("res://Scenes/Drops/Shield_50.tscn"),
	'Shield_100':preload("res://Scenes/Drops/Shield_100.tscn"),
	'Speed_6':preload("res://Scenes/Drops/Speed_5.tscn"),
	'Speed_10':preload("res://Scenes/Drops/Speed_10.tscn"),
	'Speed_16':preload("res://Scenes/Drops/Speed_15.tscn"),
	'GunLeft_Sm':preload("res://Scenes/Drops/GunLeft_Sm.tscn"),
	'GunRight_Sm':preload("res://Scenes/Drops/GunRight_Sm.tscn"),
	'GunLeftRightBig':preload("res://Scenes/Drops/GunLeftRight_Lg.tscn"),
	'Gun_Lg':preload("res://Scenes/Drops/Gun_Lg.tscn"),
	'LaserBeem_5':preload("res://Scenes/Drops/LaserBeem_5.tscn"),
	'LaserBeem_10':preload("res://Scenes/Drops/LaserBeem_10.tscn"),
	'LaserBeem_15':preload("res://Scenes/Drops/LaserBeem_15.tscn"),
	'Nuke':preload("res://Scenes/Drops/Nuke.tscn"),
	'SlowTime':preload("res://Scenes/Drops/SlowTime.tscn"),
	}
	
export var DROPS_LIST =  [
	'Health_25',
	'Health_50',
	'Health_100',
	'Shield_25',
	'Shield_50',
	'Shield_100',
	'Speed_6',
	'Speed_10',
	'Speed_16',
	'GunLeft_Sm',
	'GunRight_Sm',
	'GunLeft_Sm',
	'GunRight_Sm',
	'GunLeftRightBig',
	'Gun_Lg',
	'Gun_Lg',
	'LaserBeem_5',
	'LaserBeem_10',
	'LaserBeem_15',
	'Nuke',
	'SlowTime',
	]
	
export var SPAWN_RATE = 22

func _ready():
	$Timer.wait_time = SPAWN_RATE;
	$Timer.start()
	randomize()

func _on_Timer_timeout():
	$Timer.wait_time = SPAWN_RATE;
	#pick random from list
	var drop_id =  randi() %(DROPS_LIST.size())
	spawn(drop_id)

func spawn(id):
	var new_drop = DROPS_LIST[id]
	new_drop = DROPS_MAP[new_drop].instance()
	new_drop.position = Vector2(randi() %400,0)
	$Drops.add_child(new_drop)
	
