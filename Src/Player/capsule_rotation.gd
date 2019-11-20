extends Node

var nodes = Util.NodeDependencies.new([
	PN.Spatial.KINEMATIC_BODY,
	PN.Spatial.COLLISION_SHAPE,
	PN.Spatial.CAMERA_OFFSET
])

export (Vector3) var rot_forward = Vector3.FORWARD
export (float) var rot_angle = 0

func _ready():
	nodes.ready(owner)

func _physics_process(delta):
	var player = nodes.get(PN.Spatial.KINEMATIC_BODY)
	var shape = nodes.get(PN.Spatial.COLLISION_SHAPE)
	var camera_offset = nodes.get(PN.Spatial.CAMERA_OFFSET)
	
	var dir = rot_forward.normalized()
	var axis = dir.cross(Vector3.DOWN).normalized()
	
	#var prev_rotation = player.rotation
	player.set_rotation(Vector3.ZERO)
	player.rotate(axis, deg2rad(rot_angle))
	
	#var delta_rotation = player.rotation - prev_rotation
	# @TODO: Apply y axis counter-translation to kinematic body
	
	