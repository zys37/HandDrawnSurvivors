extends ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".max_value = global.player_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_health_bar()


func update_health_bar():
	$".".value = global.player_health
