extends Spatial

func _init():
	ObjectiveManager.step_number = ""
	ObjectiveManager.instruction = ""

func _ready():
	$Player/UI/Gun.enabled = true
