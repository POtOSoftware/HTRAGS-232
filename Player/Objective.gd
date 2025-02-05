extends Control

onready var step_number = $StepNumber
onready var instruction = $Instructions

func _physics_process(delta):
	step_number.text = ObjectiveManager.step_number
	instruction.text = ObjectiveManager.instruction
