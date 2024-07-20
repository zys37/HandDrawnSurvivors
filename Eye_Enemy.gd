extends CharacterBody2D


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide((get_parent().get_node("Hero").position - position).normalized()*2)
