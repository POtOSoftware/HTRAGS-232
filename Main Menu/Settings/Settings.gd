extends Control

func _ready():
	# If settings file exists
	if SettingsManager.load_settings() == OK:
		update_settings()
	
	if OS.get_name() == "Vita" or OS.get_name() == "Android":
		$VBoxContainer/FullscreenCheck.visible = false
		$VBoxContainer/BindUse.visible = false
		$VBoxContainer/MouseSensitivity.text = "Look Sensitivity"

# Brute forcing, professional zone only
func update_settings():
	$VBoxContainer/FullscreenCheck.pressed = SettingsManager.fullscreen
	$VBoxContainer/SFXCheck.pressed = not SettingsManager.sfx_mute
	$VBoxContainer/MusicCheck.pressed = not SettingsManager.music_mute
	$VBoxContainer/FOVSlider.value = SettingsManager.camera_fov
	$VBoxContainer/SensitivitySlider.value = SettingsManager.mouse_sensitivity
	$VBoxContainer/BindUse/BindInteract.select(SettingsManager.use_key)

func _on_FullscreenCheck_toggled(button_pressed):
	SettingsManager.fullscreen = button_pressed
	OS.window_fullscreen = SettingsManager.fullscreen

func _process(delta):
	$VBoxContainer/FOV.text = "FOV: " + str($VBoxContainer/FOVSlider.value)
	if Input.is_action_just_pressed("ui_cancel"):
		SettingsManager.save_settings()
		$".".visible = false
		$"../Title Screen".visible = true

func _on_FOVSlider_value_changed(value):
	SettingsManager.camera_fov = value

func _on_SFXCheck_toggled(button_pressed):
	SettingsManager.sfx_mute = not button_pressed
	AudioServer.set_bus_mute(2, SettingsManager.sfx_mute)

func _on_MusicCheck_toggled(button_pressed):
	SettingsManager.music_mute = not button_pressed
	AudioServer.set_bus_mute(1, SettingsManager.music_mute)

func _on_SensitivitySlider_value_changed(value):
	SettingsManager.mouse_sensitivity = value

func _on_Back_pressed():
	SettingsManager.save_settings()
	$".".visible = false
	$"../Title Screen".visible = true
	$"../Title Screen/VBoxContainer/StartGame".grab_focus()

func _on_Default_pressed():
	SettingsManager.default_settings()
	update_settings()

