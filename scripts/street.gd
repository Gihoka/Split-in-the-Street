extends Node2D

var days_counter = 1
var food_chance = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Interface/BackgroundTransition.position.y = 0
	$AnimationPlayer.play("start")
	$Interface/HUD/HBoxContainer/RightColumn/DaysCounter.modify_text(days_counter)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("OpenMenu"):
		get_tree().paused = true
		var pause_menu = preload("res://scenes/pause_menu.tscn").instantiate()
		$Interface.add_child(pause_menu)
	if days_counter > 1:
		$Controls.visible = false
		
func _on_bench_new_day():
	modify_days_counter()
	food_chance = 0.5

func modify_days_counter():
	days_counter += 1
	$Interface/HUD/HBoxContainer/RightColumn/DaysCounter.modify_text(days_counter)

func _on_food_source_food_source_searched(path, searched):
	if searched == true:
		$Player/AnimationPlayer.play("talk")
	elif randf() < food_chance && searched == false:
		get_node(path).modify_searched(true)
		food_chance -= 0.5
		get_node(path).display_split()
	elif randf() >= food_chance && searched == false:
		get_node(path).modify_searched(true)
		food_chance += 0.5
		$Player/AnimationPlayer.play("talk")
