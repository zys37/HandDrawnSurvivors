extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://world.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	global.player_health = 100
	global.stage = 0
	global.xp = 0
	global.xp_threshold = [40,80,160,320,640,1280,2560,5120,10240,10240,10240,10240,10240,10240,10240,10240,10240,10240]
	global.player_level = 1
	global.speed = 2
	global.player_health = 100
	global.enemy_damage = 5
	global.projectile_speed = 150
	global.speed_scale = 0.80
	global.is_multishot_taken = false
	global.xp_gain = 25
	global.spell_scale = 2
	global.multishot_scale = 0.1
	global.player_speed = 300
	global.wait_time = 0.35
	global.upgrade_chosen = false
	global.multishot_damage = 1
	global.spell_damage = 1
	global.laser_cooldown = 3
	global.laser_duration = 0
	global.laser_damage = 0
	global.laser_scale = 0
	global.is_laser_taken = false
	get_tree().change_scene_to_file("res://world.tscn")
	



func _on_quit_pressed():
	get_tree().quit()
