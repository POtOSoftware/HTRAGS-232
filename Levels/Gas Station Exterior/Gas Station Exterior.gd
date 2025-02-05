extends Spatial

func _ready():
	ObjectiveManager.step_number = "Step 7:"
	ObjectiveManager.instruction = "Enter Gas Station"
	
	# If GLES2
	if OS.get_current_video_driver() == 1:
		$WorldEnvironment.environment.ambient_light_energy = 2
	# If GLES3
	else:
		$WorldEnvironment.environment.ambient_light_energy = 5
