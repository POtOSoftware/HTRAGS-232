extends SpotLight

func _ready():
	# If GLES2
	if OS.get_current_video_driver() == 1:
		light_energy = 5
	# If GLES3
	else:
		light_energy = 2
