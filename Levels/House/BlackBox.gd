extends CSGBox

func _ready():
	SpeedrunTimer.timer_on = false
	SpeedrunTimer.time = 0
	get_node("../Player/UI/Dialog").visible = false
	
	get_node("../Player").can_look = false
	get_node("../Player").can_move = false
	
	ObjectiveManager.step_number = "Step 1:"
	ObjectiveManager.instruction = "Wake Up"
	
	GlobalFlags.rats_killed = 0
	GlobalFlags.times_robbed = 0
	GlobalFlags.coping_and_seething = false
	GlobalFlags.tech_chip_grabbed = false
	GlobalFlags.tech_chip_filled = false
	GlobalFlags.ex_killed = false
	GlobalFlags.gun_grabbed = false
	
	

func interact():
	if GlobalFlags.speedrun_mode:
		SpeedrunTimer.timer_on = true
	
	get_node("../Player").can_look = true
	get_node("../Player").can_move = true
	
	ObjectiveManager.step_number = "Step 2:"
	ObjectiveManager.instruction = "Smash that DAMN alarm clock"
	
	queue_free()
