extends Node

var SETTINGS_PATH = "user://settings.cfg"

var settings_loaded = false

### Settings ###
var fullscreen = true
var sfx_mute = false
var music_mute = false
var camera_fov = 70
var mouse_sensitivity = 0.25
var use_key = 0
### Settings ###

func _init():
	# It's more convenient 
	if GlobalFlags.debug:
		SETTINGS_PATH = "res://settings.cfg"

func save_settings():
	var config = ConfigFile.new()
	
	config.set_value("settings", "fullscreen", fullscreen)
	config.set_value("settings", "sfx_mute", sfx_mute)
	config.set_value("settings", "music_mute", music_mute)
	config.set_value("settings", "camera_fov", camera_fov)
	config.set_value("settings", "mouse_sensitivity", mouse_sensitivity)
	config.set_value("settings", "use_key", use_key)
	
	config.save(SETTINGS_PATH)

func load_settings():
	var config = ConfigFile.new()
	var err = config.load(SETTINGS_PATH)
	
	# If the save file exists
	if err == OK:
		# Set the variables to whatever is in the settings
		fullscreen = config.get_value("settings", "fullscreen")
		sfx_mute = config.get_value("settings", "sfx_mute")
		music_mute = config.get_value("settings", "music_mute")
		camera_fov = config.get_value("settings", "camera_fov")
		mouse_sensitivity = config.get_value("settings", "mouse_sensitivity")
		use_key = config.get_value("settings", "use_key")
		
		settings_loaded = true
	
	return err

func default_settings():
	fullscreen = true
	sfx_mute = false
	music_mute = false
	camera_fov = 70
	mouse_sensitivity = 0.25
	use_key = 0
	
	save_settings()
