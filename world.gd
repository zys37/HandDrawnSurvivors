extends Node2D

var stage = 0

func spawn_mob():
	var eye_mob = preload("res://Eye_Enemy.tscn").instantiate()
	var tentacle_enemy = preload("res://tentacle_enemy.tscn").instantiate()
	var weird_enemy = preload("res://weird_enemy.tscn").instantiate()
	var enemies = [eye_mob,tentacle_enemy,weird_enemy]
	%PathFollow2D.progress_ratio = randf_range(0,1)
	enemies[stage].global_position = %PathFollow2D.global_position
	add_child(enemies[stage])


func _on_timer_timeout():
	spawn_mob()
