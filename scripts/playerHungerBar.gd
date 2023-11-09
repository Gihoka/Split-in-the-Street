extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_hunger_modified(hunger):
	match hunger:
		0.0:
			frame = 20
		0.5:
			frame = 19
		1.0:
			frame = 18
		1.5: 
			frame = 17
		2.0:
			frame = 16
		2.5:
			frame = 15
		3.0:
			frame = 14
		3.5:
			frame = 13
		4.0: 
			frame = 12
		4.5:
			frame = 11
		5.0:
			frame = 10
		5.5:
			frame = 9
		6.0:
			frame = 8
		6.5: 
			frame = 7
		7.0:
			frame = 6
		7.5:
			frame = 5
		8.0:
			frame = 4
		8.5:
			frame = 3
		9.0: 
			frame = 2
		9.5:
			frame = 1
		10.0:
			frame = 0
