extends Node2D
var direction = Vector2.RIGHT

func bigger_spell():
	$".".scale.x=global.multishot_scale
	$".".scale.y=global.multishot_scale
func _physics_process(delta):
	translate(direction.normalized()*global.projectile_speed*delta)
	
func _process(delta):
	bigger_spell()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_2d_body_entered(body):
	queue_free()
	if body.has_method("dmg_taken"):
		body.dmg_taken()
