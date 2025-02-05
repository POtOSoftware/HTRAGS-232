extends CSGBox

var dialog = ["", "I'm leaving you and taking all my stuff. -Your ex"]
var dialog_names = ["", "Note"]

func speak():
	DialogManager.play_dialog(dialog, dialog_names)
