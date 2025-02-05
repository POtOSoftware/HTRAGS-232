extends Node

# The dialog UI gets these variables and sets the text to whatever is in these vars
var dialog_name = ""
var dialog_text = ""

var counter = 0
var name_counter = 0

var last_line_reached : bool

# I've been spelling dialogue wrong this whole time... oh well

func play_dialog(in_dialog_text, in_dialog_name, reset : bool = false):
	# I never used this, lol... UNTIL NOW!
	if reset:
		# This is only really useful for single line dialogs after already having dialog
		counter = 0
		name_counter = 0
	name_counter += 1
	# This makes the array wrap around to index 1, prevents null. Keeps the debugger happy too
	# Ignore the last line, it now just repeats the last line, as there was never a case where you would repeat dialog
	if name_counter == in_dialog_name.size():
		name_counter = in_dialog_name.size() - 1
	dialog_name = in_dialog_name[name_counter]
	counter += 1
	# Same as the name_counter code, this one's for the actual dialog rather than the speaker's name
	if counter == in_dialog_text.size():
		counter = in_dialog_text.size() - 1
		last_line_reached = true
	dialog_text = in_dialog_text[counter]
