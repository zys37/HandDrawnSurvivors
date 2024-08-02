extends Control
@onready var left_upgrade = $"Left Upgrade"
@onready var right_upgrade = $"Right Upgrade"

var upgrades = ["Increase the speed of your spells", "Increase the size of your spells", "You move faster", "Gain 25% more xp" , "Increase Spawn Rate of Enemies", "Multishot"]

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_upgrade_buttons()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"Left Upgrade".text == $"Right Upgrade".text:
		generate_upgrade_buttons()
	
func generate_upgrade_buttons():
	get_tree().paused = true
	$"Left Upgrade".text = upgrades.pick_random()
	$"Right Upgrade".text = upgrades.pick_random()
	if $"Left Upgrade".text == $"Right Upgrade".text:
		$"Right Upgrade".text = upgrades.pick_random()


func _on_left_upgrade_pressed():
	if $"Left Upgrade".text == upgrades[0]:
		global.projectile_speed += 25
	if $"Left Upgrade".text == upgrades[1]:
		global.spell_scale += 0.4
		global.multishot_scale += 0.1
	if $"Left Upgrade".text == upgrades[2]:
		global.player_speed+=40
	if $"Left Upgrade".text == upgrades[3]:
		global.xp_gain+=1
	if $"Left Upgrade".text == upgrades[4]:
		global.wait_time-=0.3
	if $"Left Upgrade".text == upgrades[5]:
		global.is_multishot_taken = true
	if $"Left Upgrade".text == upgrades[5] and global.is_multishot_taken == true:
		global.multishot_damage+=0.25
	global.upgrade_chosen = true
	get_tree().paused = false


func _on_right_upgrade_pressed():
	if $"Right Upgrade".text == upgrades[0]:
		global.projectile_speed += 25
	if $"Right Upgrade".text == upgrades[1]:
		global.spell_scale += 0.4
		global.multishot_scale += 0.1
	if $"Right Upgrade".text == upgrades[2]:
		global.player_speed+=40
	if $"Right Upgrade".text == upgrades[3]:
		global.xp_gain+=1
	if $"Right Upgrade".text == upgrades[4]:
		global.wait_time-=0.3
	if $"Right Upgrade".text == upgrades[5]:
		global.is_multishot_taken = true
	if $"Right Upgrade".text == upgrades[5] and global.is_multishot_taken == true:
		global.multishot_damage+=0.25
	global.upgrade_chosen = true
	get_tree().paused = false
