extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_playing = 0
var multishot_scene = preload("res://Multishot.tscn")

func fire():
	var multishot = multishot_scene.instantiate()
	multishot.direction = ($Node2D/Marker2D.global_position - global_position).normalized()
	multishot.global_position = $Node2D/Marker2D.global_position
	get_tree().get_root().add_child(multishot)

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
	
	var direction = Vector2()
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1

	if Input.is_action_pressed("ui_left"):
		direction.x = -1
		$Hero.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
		$Hero.flip_h = false

	if direction.length() > 0:
		direction = direction.normalized()
		is_playing = 1
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		is_playing = 0
	if Input.is_action_pressed("ui_select"):
		fire()
	if global.player_health <= 0:
		get_tree().paused = true 
	move_and_slide()



func _on_area_2d_body_entered(body):
	if body.has_method("dmg_taken"):
		global.player_health-=global.enemy_damage
		body.ButtonTimer.start()
		



func _on_area_2d_body_exited(body):
	if body.has_method("dmg_taken"):
		body.ButtonTimer.stop()
