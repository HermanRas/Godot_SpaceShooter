extends Node

func _ready():
	var SPAWNER = get_parent().get_node("Spawner")
	SPAWNER.SPAWN_RATE = 3
	SPAWNER.ENEMIES_LIST = ['Enemy1','Enemy1','Enemy1','Enemy2','Enemy3','Enemy4','Enemy4','Enemy4','Enemy4','Enemy4','Enemy4','Enemy5','Enemy6','Astroid1','Astroid2'] 
