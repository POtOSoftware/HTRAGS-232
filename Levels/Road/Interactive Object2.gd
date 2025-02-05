extends CSGBox

#onready var player_step_number = get_tree().get_current_scene().get_node("Player/UI/Objective/StepNumber")
#onready var player_instruction = get_tree().get_current_scene().get_node("Player/UI/Objective/Instructions")

var objective = load("res://Global/ObjectiveManager.gd").new()

func interact():
	ObjectiveManager.step_number = "Step 2:"
	ObjectiveManager.instruction = "Jump off the edge lol"
	#player_step_number.text = "Step: 2"
	#player_instruction.text = "Jump off the edge lol"
	#print(player_instruction.text)
