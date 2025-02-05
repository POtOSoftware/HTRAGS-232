extends Spatial

func _ready():
	if !GlobalFlags.gun_grabbed:
		ObjectiveManager.step_number = "Step 12:"
		ObjectiveManager.instruction = "Or don't, asshole"
	else:
		if not GlobalFlags.coping_and_seething:
			ObjectiveManager.step_number = "Step 13:"
		else:
			ObjectiveManager.step_number = "Step 16:"
		ObjectiveManager.instruction = "Enter Gas Station (again)"
		$Player/UI/Gun.enabled = true
	
	# If GLES2
	if OS.get_current_video_driver() == 1:
		$WorldEnvironment.environment.ambient_light_energy = 2
	# If GLES3
	else:
		$WorldEnvironment.environment.ambient_light_energy = 5
