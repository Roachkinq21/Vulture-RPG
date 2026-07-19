extends Node

@export_enum("Safe:20", "Risky:10", "Dangerous:5") var level : int 

func _ready() -> void:
	print(level)
