extends Node3D

@onready var single_1: Marker3D = $SingleEnemy/single1
@onready var camera_3d: Camera3D = $Camera3D

var encounter


func _ready() -> void:
	camera_3d.current = true
	var enemy_mesh = MeshInstance3D.new()
	
	enemy_mesh.mesh = BoxMesh.new()
	
	single_1.add_child(enemy_mesh)
	print("Battle scene loaded!")
