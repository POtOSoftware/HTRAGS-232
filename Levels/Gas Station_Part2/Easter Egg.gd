extends StaticBody

var dialog = ["", "What are you looking at?"]
var dialog_names = ["", "Store Clerk"]

func speak():
	DialogManager.play_dialog(dialog, dialog_names)
