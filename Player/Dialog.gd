extends Control

onready var dialogue_name = $DialogName
onready var dialogue_text = $DialogText
onready var arrow = $Arrow


func _physics_process(delta):
	arrow.visible = !DialogManager.last_line_reached
	
	dialogue_name.text = DialogManager.dialog_name
	dialogue_text.text = DialogManager.dialog_text
