extends Area2D

signal new_day

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite2D.animation == "player_close" && Input.is_action_just_pressed("Interact"):
		get_tree().paused = true
		var loading_screen = preload("res://scenes/loading_screen.tscn").instantiate()
		loading_screen.process_mode = PROCESS_MODE_ALWAYS
		loading_screen.get_node("AnimationPlayer").animation_finished.connect(_on_loading_screen_animation_player_animation_finished)
		add_sibling(loading_screen)


func _on_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "player_close"


func _on_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "player_far"

func _on_loading_screen_animation_player_animation_finished(anim_name):
	if anim_name == "start":
		$AnimatedSprite2D.animation = "player_far"
		new_day.emit()
	if anim_name == "end":
		get_tree().paused = false
