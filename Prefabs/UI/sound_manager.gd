extends Node

@export var root_path : NodePath

@onready var sfx = {
	&"bong_001" : AudioStreamPlayer.new(),
	&"drop_002" : AudioStreamPlayer.new(),
	&"select_007" : AudioStreamPlayer.new(),
	&"toggle_001" : AudioStreamPlayer.new(),
	}
	
func _ready():
	assert(root_path != null, "EMPTY ROOT PATH!!!")
	
	for i in sfx.keys():
		sfx[i].stream = load("res://Audio/SFX/" + str(i) + ".ogg")
		sfx[i].bus = &"SFX"
		add_child(sfx[i])
		
		install_sounds(get_node(root_path))
		
		
func install_sounds(node : Node) -> void:
	for child in node.get_children():
		if child is Button:
			child.mouse_entered.connect(ui_sfx_play.bind(&"bong_001"))
			child.pressed.connect(ui_sfx_play.bind(&"select_007"))
		install_sounds(child)

func ui_sfx_play(sound : StringName) -> void:
	sfx[sound].play()
