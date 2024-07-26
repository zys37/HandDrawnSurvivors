extends Node2D
var direction = Vector2.RIGHT
var speed = 300

#func _process(delta):
	#translate(direction.normalized()*speed*delta)

func _on_body_entered(body):
	#dmg here
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
