extends Node

var dev_console_visible = false

func create_instance(add):
	var scene = load(add)
	var scene_instance = scene.instance()
	return scene_instance

var dev_console = create_instance("res://DevConsole/DevConsole.tscn")
onready var dev_console_ui = dev_console.get_node("UI")

func _ready():
	pass

func _input(event):
	if GlobalFlags.debug:
		var just_pressed = event.is_pressed() and not event.is_echo()
		
		if event is InputEventKey:
			if event.scancode == KEY_QUOTELEFT and just_pressed:
				if dev_console_visible:
					remove_child(dev_console)
					# If the current scene has a player, capture the mouse when exiting dev console
					if get_tree().get_current_scene().get_node("Player") != null:
						Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
					dev_console_visible = false
				else:
					add_child(dev_console)
					Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
					dev_console_visible = true
