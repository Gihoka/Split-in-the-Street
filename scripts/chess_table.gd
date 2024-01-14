extends Area2D

var interacted = false
var times_interacted = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite2D.animation == "player_close" && Input.is_action_just_pressed("Interact") && interacted == false:
		interacted = true
		times_interacted += 1
		$Label.text = "Chess mastery " + str(times_interacted) + "/5."
		$AnimationPlayer.play("talk")
		
	if times_interacted == 5: 
		get_tree().change_scene_to_file("res://scenes/ending_5.tscn")

		
func _on_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "player_close"

func _on_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite2D.animation = "player_far"

func _on_bench_new_day():
	interacted = false
