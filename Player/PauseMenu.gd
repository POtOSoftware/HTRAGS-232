extends Control

var can_pause = true

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("quit") and !GlobalFlags.loading and can_pause:
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		if OS.get_name() == "Vita":
			$VBoxContainer/Resume.grab_focus()
		if new_pause_state:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Resume_pressed():
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_Reset_pressed():
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	LevelManager.load_level("res://Levels/House/House.tscn")
	SpeedrunTimer.time = 0

func _on_Quit_pressed():
	get_tree().paused = false
	visible = false
	if OS.get_name() == "Vita":
		# Same thing as on the disclaimer screen:
		# The Vita takes a second to load the main menu, this is to let the player know it IS doing something
		LevelManager.load_level("res://Main Menu/Main Menu.tscn")
	else:
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
