extends Control

func _physics_process(delta):
	$DialogName.text = DialogManager.dialog_name
	$DialogText.text = DialogManager.dialog_text
