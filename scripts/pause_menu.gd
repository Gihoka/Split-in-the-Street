extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("OpenMenu"):
		get_tree().paused = false
		queue_free()

func _on_quit_pressed():
	AudioStreamPlayerButton.play()
	for button in get_tree().get_nodes_in_group("Buttons"):
		button.set_disabled(true)
	$AnimationPlayer.play("end")
	
func _on_continue_pressed():
	AudioStreamPlayerButton.play()
	get_tree().paused = false
	queue_free()	

func _on_animation_player_animation_finished(anim_name):
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/home_screen.tscn")

func _on_achievements_pressed():
	AudioStreamPlayerButton.play()
	set_process(false)
	var achievements = preload("res://scenes/achievements.tscn").instantiate()
	achievements.achievements_closed.connect(_on_achievements_achievements_closed)
	add_child(achievements)

func _on_achievements_achievements_closed(): 
	set_process(true)
