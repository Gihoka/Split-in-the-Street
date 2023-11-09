extends Sprite2D

signal food_split
signal split_finished

var food_width = 0
var current_position = 0

func _ready():
	set_process_input(false)
	food_width = $"../Food".get_texture().get_width()
	position.y = -$"../Food".get_texture().get_height()/2
	
func _process(delta):
	pass
	
func _input(event):
	if Input.is_action_just_pressed("Left"):
		current_position = max(current_position - 1, -2)
		position.x = food_width * (current_position / 4.0)
	elif Input.is_action_just_pressed("Right"):
		current_position = min(current_position + 1, 2)
		position.x = food_width * (current_position / 4.0)
	elif Input.is_action_just_pressed("Interact"):
		set_process_input(false)
		split_finished.emit()
		food_split.emit(current_position)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "start":
		set_process_input(true)
