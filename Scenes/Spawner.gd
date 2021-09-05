extends Node

var ENEMIES_MAP =  {
	'Astroid1':preload( "res://Scenes/Astroids/Astroid1.tscn"),
	'Astroid2':preload("res://Scenes/Astroids/Astroid2.tscn"),
	'Enemy1':preload("res://Scenes/Enemy/Enemy1.tscn"),
	'Enemy2':preload("res://Scenes/Enemy/Enemy2.tscn"),
	'Enemy3':preload("res://Scenes/Enemy/Enemy3.tscn"),
	'Enemy4':preload("res://Scenes/Enemy/Enemy4.tscn"),
	'Enemy5':preload("res://Scenes/Enemy/Enemy5.tscn"),
	'Enemy6':preload("res://Scenes/Enemy/Enemy6.tscn"),
	}
	
export var ENEMIES_LIST =  ['Enemy1']
export var SPAWN_RATE = 0.9

func _ready():
	$Timer.wait_time = SPAWN_RATE;
	randomize()

func _on_Timer_timeout():
	$Timer.wait_time = SPAWN_RATE + 0.1;
	#pick random from list
	var enemy_id =  randi() %(ENEMIES_LIST.size())
	spawn(enemy_id)

func spawn(id):
	var new_enemy = ENEMIES_LIST[id]
	new_enemy = ENEMIES_MAP[new_enemy].instance()
	new_enemy.position = Vector2((randi() %354)+30,-30)
	$Enemies.add_child(new_enemy)
	
