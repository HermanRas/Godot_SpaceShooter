extends "res://Scenes/Enemy/Enemy_base.gd"

func _ready():
	set_HEALTH(15)
	set_SPEED(200)

func _physics_process(_delta):
	if .get_parent().get_child_count() == 1 :
		get_parent().queue_free()
