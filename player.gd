extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_playing = 0

func _physics_process(delta):
	# Add the gravity.
	# Handle jump.
	if is_playing==0:
		$Hero.play("Idle")
	else:
		$Hero.play("Walking")
	if Input.is_action_pressed("ui_up"):
		is_playing = 1
		velocity.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		is_playing = 1
		velocity.y = SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		is_playing = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		is_playing = 1
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("ui_left"):
		$Hero.flip_h = true
	if Input.is_action_pressed("ui_right"):
		$Hero.flip_h = false
	move_and_slide()
