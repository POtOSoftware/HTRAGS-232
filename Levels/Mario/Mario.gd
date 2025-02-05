extends Spatial

func _ready():
	ObjectiveManager.step_number = ""
	ObjectiveManager.instruction = ""
	$Player/UI/Gun.enabled = true
	
	GlobalFlags.goombas_killed = 0

	# If GLES2
	if OS.get_current_video_driver() == 1:
		$WorldEnvironment.environment.ambient_light_energy = 2
	# If GLES3
	else:
		$WorldEnvironment.environment.ambient_light_energy = 5

func _on_SecretEnding1_body_entered(body):
	if body.name == "Player":
		EndingManager.end_game("You're about as intelligent as a Microsoft UI Designer")


func _on_SecretEnding2_body_entered(body):
	if body.name == "Player":
		EndingManager.end_game(" \"Another one\" -DJ Khaled ")
