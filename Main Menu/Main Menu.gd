extends Control

export(String, FILE, "*.tscn") var play_scene = "res://Levels/House/House.tscn"

func _ready():
	# This fixes a very specific bug where the dialog box will show up again after starting the game again
	DialogManager.dialog_name = ""
	DialogManager.dialog_text = ""
	
	#GlobalFlags.speedrun_mode = false
	#$"Title Screen/VBoxContainer/StartGame/Speedrun Check".pressed = GlobalFlags.speedrun_mode
	
	if OS.get_name() == "HTML5" or OS.get_name() == "Android" or OS.get_name() == "Vita":
		$"Title Screen/VBoxContainer/QuitGame".visible = false
		
		if OS.get_name() == "Vita":
			$"Title Screen/VBoxContainer/StartGame".grab_focus()

func _on_QuitGame_pressed():
	get_tree().quit()

func _on_StartGame_pressed():
	LevelManager.load_level(play_scene)

func _on_Settings_pressed():
	$"Title Screen".visible = false
	$Settings.visible = true
	$Settings/Back.grab_focus()

func _on_StartGame_mouse_entered():
	$"Title Screen/VBoxContainer/StartGame/Speedrun Check".visible = true

func _on_Speedrun_Check_toggled(button_pressed):
	 GlobalFlags.speedrun_mode = button_pressed

# HAHAHAHA I FORGOT TO NAME THE CREDITS BUTTON WHO CARES HAHAHAHAHA
func _on_Button_pressed():
	LevelManager.load_level("res://Levels/Credits/Credits.tscn")

func _on_StartGame_focus_entered():
	$"Title Screen/VBoxContainer/StartGame/Speedrun Check".visible = true
