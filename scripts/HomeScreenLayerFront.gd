extends ParallaxLayer

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BackgroundFront.position.x += -speed * delta
	if $BackgroundFront.position.x <= -$BackgroundFront.texture.get_width():
		$BackgroundFront.position.x = 0
