extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/home_screen.tscn")
