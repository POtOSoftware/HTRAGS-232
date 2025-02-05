extends CanvasLayer

export(NodePath) var input : NodePath
export(NodePath) var output : NodePath

var input_ : Control
var output_ : Control

var history_ = [""]

var test_var = 24
var test_bool = false

###### COMMANDS ######

func clear() -> void:
	output_.text = ""

func quit(to_main_menu = false):
	if to_main_menu:
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
		echo("Quitting to main menu...")
	else:
		get_tree().quit()

# !!!IMPORTANT!!!
# In order to use this function, you MUST enclose the variable around quotes ("") or else it will not work
# It doesn't work anyways LOL
func set_var(variable, val):
	var previous_value = get(variable)
	# Yes, the set_var function is redundant as set() does exactly what this command does
	# However, I wanted more feedback that the command did something so I did this
	set(variable, val)
	echo("Changed variable " + str(variable) + " from " + str(previous_value) + " to " + str(val) + "\n")

func load_level(path : String):
	#echo("Loading level " + path + "...")
	#get_tree().change_scene(path)
	var err = get_tree().change_scene("res://Levels/" + path)
	echo("Loading level " + path + "...")
	if err !=OK:
		echo("Error loading " + path + "!")

func speedrun_mode(enabled : bool):
	GlobalFlags.speedrun_mode = enabled
	echo("Speedrun mode: " + str(enabled))

func quick_reset(current_scene : bool = false):
	#GlobalFlags.speedrun_mode = false
	SpeedrunTimer.timer_on = false
	SpeedrunTimer.time = 0
	if current_scene:
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene("res://Levels/House/House.tscn")

func time_scale(time_scale : float):
	Engine.set_time_scale(time_scale)
	echo("Setting time scale to " + str(time_scale))

# Super simple function since the regular Godot print() function only prints to the debug console and not the output box
func echo(input):
	output_.text += str(input) + "\n"

###### END OF COMMANDS ######

# Does some shit, I don't really know, I followed a tutorial for this
func _ready():
	input_ = get_node(input)
	output_ = get_node(output)
	input_.connect("gui_input", self, "_on_input")
	
	input_.grab_focus()
	
	# This shows when the console is used
	echo("How To Rob A Gas Station Developer Console")

func _on_input(event : InputEvent) -> void:
	if event is InputEventKey:
		# When the up key is pressed, it loads the last command used.
		# However, it only loads the last command used and doesn't cycle through all commands run
		if event.scancode == KEY_UP and event.pressed:
			input_.text = history_[0]
			
		# This code is run when enter is pressed, assuming the user put in a command
		if event.scancode == KEY_ENTER and event.pressed:
			if event is InputEventWithModifiers and not event.shift:
				var expression = Expression.new()
				
				# Puts the run command to the front of the history array
				history_.push_front(input_.text)
				
				# This is pretty much just here in case no command was typed in
				var parse_error = expression.parse(input_.text)
				if parse_error != OK:
					output_.text += expression.get_error_text() + "\n"
				
				# If any error with executing a command has occured, this bit of code before the elif just prints the error
				var execute_result = expression.execute([], self)
				if expression.has_execute_failed():
					output_.text += expression.get_error_text() + "\n"
				# If there's a valid command, this bit of code will return the output of the command
				elif execute_result != null:
					if not execute_result is Object:
						output_.text += String(execute_result) + "\n"
			
				input_.text = ""
				
				output_.scroll_vertical = INF
