extends Label
var SPEED = 1.5

func _ready():
	var Pos_X = SPEED
	set_position(Vector2(Pos_X,0))
	
func _physics_process(_delta):
	var Pos_X =  get_position().x + SPEED
	set_position(Vector2(Pos_X,0))

func _on_Timer_timeout():
	queue_free()
