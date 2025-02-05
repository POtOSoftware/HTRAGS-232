# Wahoo another debug menu!
extends Control

func _ready():
	# I often forget to hide the debug menu in the editor after working on it, this just fixes my pooheadness
	visible = false

func _on_Exit_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("debug.enable_menu") and GlobalFlags.debug:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		visible = true
		get_tree().paused = true

func _on_GiveGun_pressed():
	GlobalFlags.player_gun.enabled = not GlobalFlags.player_gun.enabled

func _on_MainMenu_pressed():
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")

# Level select signalz
func _on_Arrested_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Arrested Cutscene/Arrested.tscn")

func _on_Credits_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Credits/Credits.tscn")

func _on_GasStation_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Gas Station/Gas Station.tscn")

func _on_GasStation2_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Gas Station_Part2/Gas Station2.tscn")

func _on_GasExterior_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Gas Station Exterior/Gas Station Exterior.tscn")

func _on_GasExterior2_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Gas Station Exterior_Part2/Gas Station Exterior2.tscn")

func _on_House_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/House/House.tscn")

func _on_House2_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/House_Part2/House2.tscn")

func _on_Mario_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Mario/Mario.tscn")

func _on_Road_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Road/Road.tscn")

func _on_Sewer_pressed():
	get_tree().paused = false
	LevelManager.load_level("res://Levels/Sewer/Sewer.tscn")

func _on_HideUI_toggled(button_pressed):
	# Can't just hide the UI node directly because then that'll hide the debug menu too
	$"../SpeedrunLabel".visible = not button_pressed
	$"../Crosshair".visible = not button_pressed
	$"../InteractionHint".visible = not button_pressed
	$"../Objective".visible = not button_pressed
	$"../Gun".visible = not button_pressed
	$"../MobileControls".visible = not button_pressed
	$"../Dialog".visible = not button_pressed

func _on_Reload_pressed():
	get_tree().reload_current_scene()
