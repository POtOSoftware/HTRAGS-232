extends StaticBody

func _ready():
	if GlobalFlags.coping_and_seething:
		$"../Architecture/Front Door".use_collision = false
	if not GlobalFlags.coping_and_seething:
		ObjectiveManager.step_number = "Step 11:"
		ObjectiveManager.instruction = "Get your gun"
		
func interact():
	$"../Player/UI/Gun".enabled = true
	$"../Player/UI/Gun/AnimationPlayer".play("Rise")
	$"../GunCockSFX".play()
	
	if not GlobalFlags.coping_and_seething:
		ObjectiveManager.step_number = "Step 12:"
	else:
		ObjectiveManager.step_number = "Step 15:"
		$"../Architecture/Front Door".use_collision = true
	ObjectiveManager.instruction = "Go back to the gas station"
	
	GlobalFlags.gun_grabbed = true
	
	queue_free()
