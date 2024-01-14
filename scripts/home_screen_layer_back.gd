extends ParallaxLayer

var speed = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BackgroundBack.position.x += -speed * delta
	if $BackgroundBack.position.x <= -$BackgroundBack.texture.get_width():
		$BackgroundBack.position.x = 0
