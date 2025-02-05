extends StaticBody

func interact():
	$AlarmSFX.playing = false
	$SmashSFX.play()
	$CollisionShape.disabled = true
	
	ObjectiveManager.step_number = "Step 3:"
	ObjectiveManager.instruction = "Piss"
	
	get_node("../Shitter").current_objective = true
