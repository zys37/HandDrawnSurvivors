extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	update_xp_bar()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_xp_bar()
	check_level_up()

func gain_exp(amount: int):
	global.xp +=amount
	while global.xp >= global.xp_threshold[global.player_level]:
		global.xp -= global.xp_threshold[global.player_level]
		global.player_level +=1
	update_xp_bar()

func update_xp_bar():
	$".".max_value = global.xp_threshold[global.player_level]
	$".".value = global.xp
func check_level_up():
	while global.xp >= global.xp_threshold[global.player_level]:
		global.xp -= global.xp_threshold[global.player_level]
		global.player_level +=1
