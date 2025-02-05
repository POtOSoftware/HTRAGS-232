extends StaticBody

var current_objective = false

func interact():
	$FlushSFX.play()
	# Prevents sequence breaking
	if current_objective:
		current_objective = false
		ObjectiveManager.step_number = "Step 4:"
		ObjectiveManager.instruction = "Read note on door"
		
		get_node("../../Note").use_collision = true
		get_node("../../Note").current_objective = true
		get_node("../Sink").current_objective = false
