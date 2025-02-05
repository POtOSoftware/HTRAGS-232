extends CSGBox

var dialog = ["", "I'm leaving you and taking all my stuff. -Your ex"]
var dialog_names = ["", "Note"]

var current_objective = false

func _ready():
	use_collision = false

func speak():
	DialogManager.play_dialog(dialog, dialog_names)
	
	if current_objective:
		ObjectiveManager.step_number = "Step 5:"
		ObjectiveManager.instruction = "Find your wallet"
		get_node("../Wallet").visible = true
		get_node("../Wallet/CollisionShape").disabled = false
		
		current_objective = false
