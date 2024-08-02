extends Node2D
var direction = Vector2.RIGHT

	
func bigger_spell():
	$".".scale.x=global.spell_scale
	$".".scale.y=global.spell_scale

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
func _process(delta):
	bigger_spell()

func _on_area_2d_body_entered(body):
	if body.has_method("dmg_taken"):
		body.dmg_taken(global.spell_damage)
