extends Node2D

const maxrange = 5000
var based_width = 5
var widthy = based_width
var shoot = false
@onready var collision = $RayCast2D/Line2D/StaticBody2D/CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$RayCast2D/CastingParticles.emitting = false
	$RayCast2D/BeamParticles2D.emitting = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$RayCast2D/Line2D.width = widthy
	var mouse_position = get_local_mouse_position()
	var max_cast_to = mouse_position.normalized()*maxrange
	$RayCast2D.target_position = max_cast_to
	
	if $RayCast2D.is_colliding():
		$Reference.global_position = $RayCast2D.get_collision_point()
		$RayCast2D/Line2D.set_point_position(1,$RayCast2D/Line2D.to_local($Reference.global_position))
	else:
		$Reference.global_position = $RayCast2D.target_position
		$RayCast2D/Line2D.points[1] = $Reference.global_position
		$RayCast2D/BeamParticles2D.position = $Reference.global_position
		$RayCast2D/BeamParticles2D.process_material.emission_box_extents.x = $Reference.global_position.length()
	if shoot == true:
		collision.shape.b = $RayCast2D/Line2D.points[1]
		collision.disabled = false
		$RayCast2D/Line2D.visible = true
	else:
		collision.shape.b = Vector2.ZERO
		collision.disabled = true
		$RayCast2D/Line2D.visible = false
	if Input.is_action_pressed("click"):
		shoot = true
		$RayCast2D/BeamParticles2D.emitting = true
		$RayCast2D/CastingParticles.emitting = true
	else:
		shoot = false
		$RayCast2D/CastingParticles.emitting = false
		$RayCast2D/BeamParticles2D.emitting = false
