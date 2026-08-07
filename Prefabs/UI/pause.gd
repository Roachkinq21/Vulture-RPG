extends Control

@onready var ssr_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer/HBoxContainer/SSRButton
@onready var ssao_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer2/HBoxContainer/SSAOButton
@onready var ssil_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer3/HBoxContainer/SSILButton
@onready var sdfgi_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer4/HBoxContainer/SDFGIButton

@onready var master_bus: HSlider = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer/HBoxContainer/Master_Bus
@onready var sfx_bus: HSlider = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Audio/VBoxContainer2/HBoxContainer/SFX_Bus

@onready var master_bus_core := AudioServer.get_bus_index("Master")
@onready var sfx_bus_core := AudioServer.get_bus_index("SFX")

var master_sound_var
var SFX_sound_var

func _ready() -> void:	
	master_bus.value = Config.get_master_volume()
	sfx_bus.value = Config.get_SFX_volume()



func _on_ssr_button_toggled(toggled_on: bool) -> void:
	WorldSettings.ssr_set = toggled_on


func _on_ssao_button_toggled(toggled_on: bool) -> void:
	WorldSettings.SSAOSet = toggled_on


func _on_ssil_button_toggled(toggled_on: bool) -> void:
	WorldSettings.SSILSet = toggled_on


func _on_sdfgi_button_toggled(toggled_on: bool) -> void:
	WorldSettings.SDFGISet = toggled_on


func _on_master_bus_value_changed(value: float) -> void:
	Config.set_master_volume(value)


func _on_sfx_bus_value_changed(value: float) -> void:
	Config.set_SFX_volume(value)
