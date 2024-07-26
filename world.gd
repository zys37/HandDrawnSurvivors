extends Node2D


func spawn_mob():
	var new_mob = preload("res://Eye_Enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf_range(0,1)
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()
