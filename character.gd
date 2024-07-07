extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	if Input.is_action_pressed("move_left"):
		$Body.flip_h = false
	if Input.is_action_pressed("move_right"):
		$Body.flip_h = true
	#animations
	#apply movement
	move_and_slide()
