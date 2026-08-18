extends Node

const CONFIG_PATH := "user://settings.cfg"

# Create new ConfigFile object.
var config = ConfigFile.new()

func _ready() -> void:
	var error := config.load(CONFIG_PATH)

	if error != OK:
		store_default_configs()

func store_default_configs() -> void:
	config.set_value("Master_Volume", "volume", 1.0)
	config.set_value("SFX_Volume", "volume", 1.0)
	config.set_value("SSR_Setting", "toggled", false)
	config.set_value("SSAO_Setting", "toggled", false)
	config.set_value("SSIL_Setting", "toggled", false)
	config.set_value("SDFGI_Setting", "toggled", false)
	config.save(CONFIG_PATH)

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("PowerQuit"):
		get_tree().quit()

#region VOLUME CONTROl

func get_master_volume()-> float:
	return float(config.get_value("Master_Volume", "volume", 1.0))

func set_master_volume(volume : float) -> void:
	config.set_value("Master_Volume", "volume", volume)
	config.save(CONFIG_PATH)
	var bus_index := AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_linear(bus_index, volume)

func get_SFX_volume() -> float:
	return float(config.get_value("SFX_Volume", "volume", 1.0))

func set_SFX_volume(volume : float) -> void:
	config.set_value("SFX_Volume", "volume", volume)
	config.save(CONFIG_PATH)
	var bus_index := AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_linear(bus_index, volume)

#endregion

#region GRAPHICS CONTROl

func get_SSR_Setting() -> bool:
	return bool(config.get_value("SSR_Setting", "toggled", false))
func set_SSR_Setting(toggled : bool):
	config.set_value("SSR_Setting", "toggled", toggled)
	config.save(CONFIG_PATH)

func get_SSAO_Setting():
	return bool(config.get_value("SSAO_Setting", "toggled", false))
func set_SSAO_Setting(toggled : bool):
	config.set_value("SSAO_Setting", "toggled", toggled)
	config.save(CONFIG_PATH)

func get_SSIL_Setting() -> bool:
	return bool(config.get_value("SSIL_Setting", "toggled", false))
func set_SSIL_Setting(toggled : bool):
	config.set_value("SSIL_Setting", "toggled", toggled)
	config.save(CONFIG_PATH)

func get_SDFGI_Setting() -> bool:
	return bool(config.get_value("SDFGI_Setting", "toggled", false))
func set_SDFGI_Setting(toggled : bool):
	config.set_value("SDFGI_Setting", "toggled", toggled)
	config.save(CONFIG_PATH)

#endregion