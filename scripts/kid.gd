extends RigidBody2D

signal hunger_modified

const SPEED = 100.0
var walking = false
var hunger = 5.0

func _ready():
	hunger_modified.emit(hunger)

func _process(delta):
	if linear_velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif linear_velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")

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

func modify_hunger(value):
	hunger = clamp(hunger + value, 0.0, 10.0)
	hunger_modified.emit(hunger)
	if hunger == 0:
		get_tree().change_scene_to_file("res://scenes/ending_kid.tscn")
		
func _on_knife_food_split(part):
	match part:
		-2:
			modify_hunger(0)
		-1:
			modify_hunger(0.5)
		0:
			modify_hunger(1)
		1: 
			modify_hunger(1.5)
		2:
			modify_hunger(2)


func _on_bench_new_day():
	position.x = 0
	modify_hunger(-3)
