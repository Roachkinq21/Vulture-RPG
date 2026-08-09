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

func get_SSR_Setting():
	pass
func set_SSR_Setting():
	pass

func get_SSAO_Setting():
	pass
func set_SSAO_Setting():
	pass

func get_SSIL_Setting():
	pass
func set_SSIL_Setting():
	pass

func get_SDFGI_Setting():
	pass
func set_SDFGI_Setting():
	pass

#endregion