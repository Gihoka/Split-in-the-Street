extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = 1
	modulate = Color(255,255,255,0)
	$AnimationPlayer.play("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "start":
		$Timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/home_screen.tscn")
