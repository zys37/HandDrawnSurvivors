extends RayCast2D

@onready var casting_particles: GPUParticles2D = $CastingParticles
@onready var collision_particles_2: GPUParticles2D = $CollisionParticles2
@onready var beam_particle_2d: GPUParticles2D = $BeamParticle2D
var is_casting: bool = false :
	set(value): 
		is_casting = value
		$BeamParticles2D.emitting = is_casting
		$CastingParticles.emitting = is_casting
		if is_casting:
			appear()
		else:
			$CollisionParticles.emitting = false
			disappear()
		set_physics_process(is_casting)
func _ready():
	is_casting = false

func _physics_process(delta: float) -> void:
	$is_shooting.wait_time = global.laser_cooldown
	var cast_point := target_position
	force_raycast_update()
	$CollisionParticles.emitting = is_colliding()
	if is_colliding():
		cast_point = to_local(get_collision_point())
		$CollisionParticles.global_rotation = get_collision_normal().angle()
		$CollisionParticles.position = cast_point
	$Line2D.points[1] = cast_point
	$BeamParticles2D.position = cast_point * 0.5
	$BeamParticles2D.process_material.emission_box_extents.x = cast_point.length() * 0.5
func appear() -> void:
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 3.0, 0.2)
func disappear() -> void:
	var tween = create_tween()
	tween.tween_property($Line2D, "width", 0, 0.1)


func _on_timer_timeout():
	is_casting = true
	$shoot.start()


func _on_shoot_timeout():
	is_casting = false
