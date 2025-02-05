extends StaticBody

var current_objective = false

# If you're wondering why the Unit Db is set to 80, it's because the sound is so quiet it can't be heard
func interact():
	$SinkSFX.play()
	
	if current_objective:
		ObjectiveManager.step_number = "Step 4:"
		ObjectiveManager.instruction = "Read note on door"
		
		current_objective = false
		get_node("../../Note").use_collision = true
		get_node("../../Note").current_objective = true
		get_node("../Shitter").current_objective = false

func die():
	$SinkSprite.visible = false
	$CollisionShape.disabled = true
	
	$Pipe/Pipe.visible = true
	$Pipe/CollisionShape.disabled = false
	$Pipe/SecretSFX.play()
