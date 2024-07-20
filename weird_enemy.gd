extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_parent().get_node("Hero").position +  Vector2(1000, 0).rotated(randf_range(0, 2*PI))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = (get_parent().get_node("Hero").position - position).normalized()
	move_and_collide((get_parent().get_node("Hero").position - position).normalized()*4)
	if direction.x < 0:
		$Weird_Enemy.flip_h = true
	else:
		$Weird_Enemy.flip_h = false
