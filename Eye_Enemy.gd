extends CharacterBody2D
var health = 2
# Called when the node enters the scene tree for the first time.
func dmg_taken():
	health-=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide((get_parent().get_node("Hero").position - position).normalized()*2)
	if health<=0:
		queue_free()
		
