extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("start")
	var node_name = str(get_name())
	AchievementsData.unlock_achievement(node_name[node_name.length() - 1])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "start":
		$Timer.start()
	if anim_name == "end":
		get_tree().change_scene_to_file("res://scenes/home_screen.tscn")

func _on_timer_timeout():
	$AnimationPlayer.play("end")

