extends RigidBody2D

const SPEED = 200.0

func _physics_process(delta):
	move_and_collide(linear_velocity * delta)
	
func velocity_modifier(modifier):
	linear_velocity.x = SPEED * modifier
