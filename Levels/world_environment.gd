extends WorldEnvironment



func _process(delta: float) -> void:
	environment.ssr_enabled = WorldSettings.ssr_set
	environment.ssao_enabled = WorldSettings.SSAOSet
	environment.ssil_enabled = WorldSettings.SSILSet
	environment.sdfgi_enabled = WorldSettings.SDFGISet
