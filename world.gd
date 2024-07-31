extends Node2D

func _process(delta):
	$Timer.wait_time = global.wait_time

func spawn_mob():
	var eye_mob = preload("res://Eye_Enemy.tscn").instantiate()
	var tentacle_enemy = preload("res://tentacle_enemy.tscn").instantiate()
	var weird_enemy = preload("res://weird_enemy.tscn").instantiate()
	var enemies = [eye_mob,tentacle_enemy,weird_enemy]
	%PathFollow2D.progress_ratio = randf_range(0,1)
	enemies[global.stage].global_position = %PathFollow2D.global_position
	add_child(enemies[global.stage])


func _on_timer_timeout():
	spawn_mob()
