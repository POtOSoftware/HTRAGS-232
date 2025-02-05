extends Area

func _on_Objective_body_entered(body):
	if body.name == "Player":
		$"../Counter/Clerk".current_objective = true
		$"../Door".use_collision = true
		
		ObjectiveManager.step_number = "Step 9:"
		ObjectiveManager.instruction = "Pay for chips at counter"
		
		queue_free()
