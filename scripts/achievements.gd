extends MarginContainer

signal achievements_closed

# Called when the node enters the scene tree for the first time.
func _ready():
	var row = 0
	for i in range(len(AchievementsData.achievements)):
		if i % 4 == 0:
			row += 1
		if AchievementsData.achievements[i] == true:
			get_node("HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row"+str(row)+"/Achievement"+str(i+1)).texture = load("res://images/achievement_"+str(i+1)+".png")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("OpenMenu"):
		achievements_closed.emit()
		queue_free()


func _on_close_pressed():
	AudioStreamPlayerButton.play()
	achievements_closed.emit()
	queue_free()

func _on_achievement_1_mouse_entered():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement1/Label.visible = true

func _on_achievement_1_mouse_exited():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement1/Label.visible = false

func _on_achievement_2_mouse_entered():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement2/Label.visible = true


func _on_achievement_2_mouse_exited():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement2/Label.visible = false


func _on_achievement_3_mouse_entered():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement3/Label.visible = true


func _on_achievement_3_mouse_exited():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement3/Label.visible = false


func _on_achievement_4_mouse_entered():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement4/Label.visible = true


func _on_achievement_4_mouse_exited():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row1/Achievement4/Label.visible = false


func _on_achievement_5_mouse_entered():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row2/Achievement5/Label.visible = true


func _on_achievement_5_mouse_exited():
	$HBoxContainer/TextureRect/MarginContainer/VBoxContainer/Row2/Achievement5/Label.visible = false
