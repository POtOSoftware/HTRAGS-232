extends Control

var can_player_play = false

var key_presses : int

func _init():
	SettingsManager.load_settings()
	OS.window_fullscreen = SettingsManager.fullscreen
	AudioServer.set_bus_mute(1, SettingsManager.music_mute)

func _ready():
	if OS.get_name() == "Vita":
		$Bottom.text = "Press any button to continue"
	if OS.get_name() == "Android":
		$Bottom.text = "Tap screen to continue"
		
	# If we're running on HTML5, change the pause menu key to tab rather than esc since it causes issues with web browsers
	# (I really should've done this in the first place 3:)
	if OS.get_name() == "HTML5":
		var event_key = InputEventKey.new()
		InputMap.action_erase_events("quit") # Remove all the events... if anybody is playing HTML5 with controller I SWEAR TO GOD
		
		# Set the action key to be tab
		event_key.scancode = KEY_TAB
		InputMap.action_add_event("quit", event_key)
	
	$AnimationPlayer.play("Disclaimer")
	if GlobalFlags.skip_disclaimer:
		print("Skipping disclaimer...")
		load_main_menu()

func _unhandled_input(event):
	if event.is_pressed():
		if can_player_play:
			load_main_menu()
		else:
			print("Ah ah ah, you have to say the magic word")
			key_presses += 1
	if key_presses >= 10:
		print("Fine then, asshole")
		load_main_menu()

func _on_PlzReadTimer_timeout():
	can_player_play = true

# I realize in hindsight I didn't need to do it like this... oh well
func _on_MobileButton_pressed():
	if can_player_play:
		load_main_menu()
	else:
		key_presses += 1
	if key_presses >= 10:
		load_main_menu()

func load_main_menu():
	if OS.get_name() == "Vita":
		# The Vita takes a second to load the main menu, this just lets the player know that it IS doing something
		LevelManager.load_level("res://Main Menu/Main Menu.tscn")
	else:
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
