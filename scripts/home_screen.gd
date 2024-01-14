extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	var bg_music = get_node("/root/BgMusic/AudioStreamPlayer")
	if !bg_music.is_playing():
		bg_music.stream.loop = true
		bg_music.play()
	$BackgroundTransition.position.y = 0
	$AnimationPlayer.play("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	AudioStreamPlayerButton.play()
	for button in get_tree().get_nodes_in_group("Buttons"):
		button.set_disabled(true)
	$AnimationPlayer.play("end")

func _on_achievements_pressed():
	AudioStreamPlayerButton.play()
	var achievements = preload("res://scenes/achievements.tscn").instantiate()
	add_child(achievements)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "end":
		get_tree().change_scene_to_file("res://scenes/street.tscn")
