extends RigidBody2D

const SPEED = 150.0
var walking = false

func _physics_process(delta):
	if !walking:
		linear_velocity.x = move_toward(linear_velocity.x, 0, SPEED * 3 * delta) 
	move_and_collide(linear_velocity * delta)
	
func velocity_modifier(modifier):
	if modifier == 0:
		walking = false
	else:
		linear_velocity.x = SPEED * modifier
		walking = true
