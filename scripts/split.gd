extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = 1
	position.y = 1080
	$AnimationPlayer.play("start")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_knife_split_finished():
	$AnimationPlayer.play("end")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "end":
		queue_free()
