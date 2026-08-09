extends Node3D

@onready var single_1: Marker3D = $SingleEnemy/single1
@onready var camera_3d: Camera3D = $Camera3D

var encounter

var monster_summon : int = randi_range(1,3)


func _ready() -> void:
	camera_3d.current = true
	var enemy_mesh = MeshInstance3D.new()
	
	enemy_mesh.mesh = _randomize_monster()
	
	single_1.add_child(enemy_mesh)
	print("Battle scene loaded!")

func _randomize_monster():
	
	match monster_summon:
		1:
			return BoxMesh.new()
		2:
			return SphereMesh.new()
		3:
			return CapsuleMesh.new()

