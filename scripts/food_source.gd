extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite2D.animation == "player_close" && Input.is_action_just_pressed("Interact"):
		get_tree().paused = true
		var split = preload("res://scenes/split.tscn").instantiate()
		split.process_mode = PROCESS_MODE_ALWAYS
		split.get_node("HBoxContainer/HBoxContainer2/Knife").food_split.connect($"../../Player"._on_knife_food_split)
		split.get_node("HBoxContainer/HBoxContainer2/Knife").food_split.connect($"../../Kid"._on_knife_food_split)
		split.get_node("AnimationPlayer").animation_finished.connect(_on_split_animation_player_animation_finished)
		get_parent().get_parent().get_node("Interface").add_child(split)
		

func _on_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "player_close"


func _on_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "player_far"


func _on_split_animation_player_animation_finished(anim_name):
	if anim_name == "end":
		get_tree().paused = false
