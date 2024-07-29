extends CharacterBody2D
var ButtonTimer:Timer
var health = 2
func _ready():
	ButtonTimer = Timer.new()
	ButtonTimer.set_wait_time(0.5)
	ButtonTimer.timeout.connect(self.on_timer_timeout)
	add_child(ButtonTimer)
# Called when the node enters the scene tree for the first time.
func dmg_taken():
	health-=1
func attack():
	global.player_health -= global.enemy_damage
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide((get_parent().get_node("Hero").position - position).normalized()*global.speed)
	if health<=0:
		global.xp +=1
		queue_free()
		
		
func on_timer_timeout():
	attack()
