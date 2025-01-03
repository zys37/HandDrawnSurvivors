extends CharacterBody2D


const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var timer_inactive = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_playing = 0
var multishot_scene = preload("res://Multishot.tscn")
var laser_scene = preload("res://laser.tscn")
var fire_cooldown = 0.5
var fire_timer = 0.0
func fire():
	var multishot = multishot_scene.instantiate()
	multishot.direction = ($Node2D/Marker2D.global_position - global_position).normalized()
	multishot.global_position = $Node2D/Marker2D.global_position
	get_tree().get_root().add_child(multishot)

func _physics_process(delta):
	# Add the gravity.
	# Handle jump.
	fire_timer -= delta
	if is_playing==0:
		$Hero.play("Idle")
	else:
		$Hero.play("Walking")
	if Input.is_action_pressed("ui_up"):
		is_playing = 1
		velocity.y = -global.player_speed
	elif Input.is_action_pressed("ui_down"):
		is_playing = 1
		velocity.y = global.player_speed
	else:
		velocity.y = move_toward(velocity.y, 0, global.player_speed)
		is_playing = 0
	$AnimationPlayer.speed_scale = global.speed_scale

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
		$Hero/Node2D3.position.x = -54
	elif Input.is_action_pressed("ui_right"):
		direction.x = 1
		$Hero.flip_h = false
		$Hero/Node2D3.position.x = 48

	if direction.length() > 0:
		direction = direction.normalized()
		is_playing = 1
		velocity = direction * global.player_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, global.player_speed)
		is_playing = 0
	if global.player_health <= 0:
		get_tree().change_scene_to_file("res://menu.tscn")
	if global.is_multishot_taken and fire_timer <= 0.0:
		fire()
		fire_timer = fire_cooldown
	if global.is_laser_taken == true:
		$Hero/Node2D3.visible = true
	move_and_slide()



func _on_area_2d_body_entered(body):
	if body.has_method("dmg_taken"):
		global.player_health-=global.enemy_damage
		body.ButtonTimer.start()
		



func _on_area_2d_body_exited(body):
	if body.has_method("dmg_taken"):
		body.ButtonTimer.stop()

