extends Control

@onready var ssr_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer/HBoxContainer/SSRButton
@onready var ssao_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer2/HBoxContainer/SSAOButton
@onready var ssil_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer3/HBoxContainer/SSILButton
@onready var sdfgi_button: CheckButton = $MarginContainer/ColorRect/MarginContainer/VBoxContainer/TabContainer/Graphics/VBoxContainer4/HBoxContainer/SDFGIButton


func _on_ssr_button_toggled(toggled_on: bool) -> void:
	WorldSettings.ssr_set = toggled_on


func _on_ssao_button_toggled(toggled_on: bool) -> void:
	WorldSettings.SSAOSet = toggled_on


func _on_ssil_button_toggled(toggled_on: bool) -> void:
	WorldSettings.SSILSet = toggled_on


func _on_sdfgi_button_toggled(toggled_on: bool) -> void:
	WorldSettings.SDFGISet = toggled_on
