extends Node
var SPAWNER
var DROPPER
var LevelInd = preload("res://Scenes/LevelIndecator/LeverIndecator.tscn")
var loadedUP = false
var spawn_lv = 1

func _ready():
	SPAWNER = get_parent().get_node("Spawner")
	DROPPER = get_parent().get_node("Dropper")
	loadedUP = true
	
	add_child(LevelInd.instance())
	
	SPAWNER.SPAWN_RATE = 3
	SPAWNER.ENEMIES_LIST = [
		'Enemy1',
		'Enemy1',
		'Enemy1',
		'Enemy1',
		'Enemy1',
		'Enemy1',
		'Enemy4',
		'Enemy5',
		'Astroid1',
		'Astroid2',
		'Astroid1',
		'Astroid2',
		'Astroid1',
		'Astroid2',
		'Astroid1',
		'Astroid2',
		] 
	
	DROPPER.SPAWN_RATE = 35
	DROPPER.DROPS_LIST =  [
		'Health_25',
		'Shield_25',
		'LaserBeem_5',
	]

func _process(delta):
	if !loadedUP : return
	
	if Global.SCORE == 20 && spawn_lv != 2:
		var LevelNotice = LevelInd.instance()
		LevelNotice.set_Level("LEVEL 2")
		add_child(LevelNotice)
		spawn_lv = 2
		
		SPAWNER.SPAWN_RATE = 2.5
		SPAWNER.ENEMIES_LIST = [
			'Enemy1',
			'Enemy1',
			'Enemy1',
			'Enemy1',
			'Enemy4',
			'Enemy4',
			'Enemy4',
			'Enemy5',
			'Enemy6',
			'Astroid1',
			'Astroid2',
			'Astroid1',
			'Astroid2',
			] 

		DROPPER.SPAWN_RATE = 22
		DROPPER.DROPS_LIST =  [
			'Health_25',
			'Health_50',
			'Shield_25',
			'Shield_50',
			'Health_25',
			'Health_50',
			'Shield_25',
			'Shield_50',
			'LaserBeem_5',
			'LaserBeem_10',
			'SlowTime',
			'GunLeft_Sm',
			'GunRight_Sm',
		]
		
	if Global.SCORE == 50  && spawn_lv != 3:
		var LevelNotice = LevelInd.instance()
		LevelNotice.set_Level("LEVEL 3")
		add_child(LevelNotice)
		spawn_lv = 3
		
		SPAWNER.ENEMIES_LIST = [
			'Enemy1',
			'Enemy2',
			'Enemy3',
			'Enemy4',
			'Enemy1',
			'Enemy2',
			'Enemy3',
			'Enemy4',
			'Enemy5',
			'Enemy6',
			'Astroid1',
			'Astroid2',
			'Astroid1',
			'Astroid2',
			] 

		DROPPER.SPAWN_RATE = 22
		DROPPER.DROPS_LIST =  [
			'Health_25',
			'Health_50',
			'Shield_25',
			'Shield_50',
			'Health_25',
			'Health_50',
			'Shield_25',
			'Shield_50',
			'LaserBeem_5',
			'LaserBeem_10',
			'SlowTime',
			'GunLeft_Sm',
			'GunRight_Sm',
		]
		
	if Global.SCORE == 100  && spawn_lv != 4:
		var LevelNotice = LevelInd.instance()
		LevelNotice.set_Level("LEVEL 4")
		add_child(LevelNotice)
		spawn_lv = 4
		
		SPAWNER.SPAWN_RATE = 2
		SPAWNER.ENEMIES_LIST = [
			'Enemy1',
			'Enemy2',
			'Enemy3',
			'Enemy4',
			'Enemy5',
			'Enemy6',
			'Astroid1',
			'Astroid2',
			] 

		DROPPER.SPAWN_RATE = 15
		DROPPER.DROPS_LIST =  [
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
		
	if Global.SCORE == 200  && spawn_lv != 5:
		var LevelNotice = LevelInd.instance()
		LevelNotice.set_Level("LEVEL 5")
		add_child(LevelNotice)
		spawn_lv = 5

		SPAWNER.SPAWN_RATE = 1
		DROPPER.SPAWN_RATE = 10
