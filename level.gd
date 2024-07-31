extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	update_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_level()
	update_stage()
func update_level():
	text ="Level 	" + str(global.player_level)
func update_stage():
	if global.player_level == 3:
		global.stage = 1
		global.speed = 2.5
		global.enemy_damage = 6
	if global.player_level ==6:
		global.stage = 2
		global.speed = 3
		global.enemy_damage = 7
