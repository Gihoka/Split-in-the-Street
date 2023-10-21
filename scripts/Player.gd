extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 3 * delta)
	move_and_slide()

func _on_kid_follow_body_exited(body):
	if body.name == "Kid":
		if body.position.x < position.x:
			body.velocity_modifier(1) 
		else:
			body.velocity_modifier(-1) 

func _on_kid_follow_body_entered(body):
	if body.name == "Kid":
		body.velocity_modifier(0) 
