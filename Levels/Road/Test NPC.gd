extends KinematicBody

# I don't have the patience to try and fit one of those fancy JSON-based dialog systems into my game
# This'll have to do
var dialog = ["", "Line 1", "What are you saying?", "Line 2"]
var dialog_name = ["", "Test NPC", "You", "Test NPC"]

func speak():
	DialogManager.play_dialog(dialog, dialog_name)
