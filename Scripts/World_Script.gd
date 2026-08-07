extends Node

@export var is_hostile : bool
@export_enum("Safe:20", "Risky:10", "Dangerous:5") var level : int 

var battle_scene : PackedScene = preload("res://Prefabs/Battler/BattleEnv.tscn")

@onready var battle_container: Node3D = $BattleScene

func _ready() -> void:
	var battle_env := battle_scene.instantiate()
	
	
	var player = get_node("Player")
	
	battle_container.add_child(battle_env)
	
	
