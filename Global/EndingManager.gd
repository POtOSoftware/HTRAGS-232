extends Node

var ending_quote : String

func end_game(end_quote : String="if you're seeing this, something has gone terribly wrong"):
	SpeedrunTimer.timer_on = false
	ending_quote = end_quote
	get_tree().change_scene("res://Ending Screen/Ending Screen.tscn")

func screenshot():
	var screenshot = get_viewport().get_texture().get_data()
	# For some reason, Godot flips the viewport texture vertically, so we have to flip it back to normal
	screenshot.flip_y()
	screenshot.save_png("user://screenshot.png")
	return screenshot
