extends Area2D

export var speed = 50
export var steer_force = 1.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = {position:get_global_mouse_position()}

func start(_transform, _target):
	global_transform = _transform
	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed
	target = _target

func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

func _physics_process(delta):
	target.position = get_global_mouse_position()
	acceleration += seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta
	

func _on_Missile_body_entered(body):
	explode()

func _on_Lifetime_timeout():
	explode()

func explode():
#	set_physics_process(false)
#	$AnimationPlayer.play("explode")
#	yield($AnimationPlayer, "animation_finished")
	queue_free()
