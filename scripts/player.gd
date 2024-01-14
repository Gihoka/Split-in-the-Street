extends CharacterBody2D

signal hunger_modified
signal hunger_depleted

const SPEED = 250.0
var hunger = 8.0

func _ready():
	hunger_modified.emit(hunger)
	
func _process(delta):
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 3 * delta)
	move_and_slide()

func modify_hunger(value):
	hunger = clamp(hunger + value, 0.0, 10.0)
	hunger_modified.emit(hunger)
	if hunger == 0:
		hunger_depleted.emit()
	
func _on_kid_follow_body_exited(body):
	if body.name == "Kid":
		if body.position.x < position.x:
			body.velocity_modifier(1) 
		else:
			body.velocity_modifier(-1) 

func _on_kid_follow_body_entered(body):
	if body.name == "Kid":
		body.velocity_modifier(0) 

func _on_knife_food_split(part):
	if hunger == 0.5 && part != -2 && part != 2:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scenes/ending_4.tscn")
		
	match part:
		-2:
			modify_hunger(2)
		-1:
			modify_hunger(1.5)
		0:
			modify_hunger(1)
		1: 
			modify_hunger(0.5)
		2:
			modify_hunger(0)


func _on_bench_new_day():
	position.x = 0
	modify_hunger(-2.5)
