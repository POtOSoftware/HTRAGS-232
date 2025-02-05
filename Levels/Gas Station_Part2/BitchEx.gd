extends KinematicBody

var dialog = ["", "You with him?", "Yep, I fucked Ted", "Oh man. His name just HAS to be Ted", "Cope and seethe"]
var dialog_names = ["", "You", "Bitch Ex", "You", "Bitch Ex"]

var clerk_killed_dialog = ["", "Oh wow, you're such a strong man killing him like that", "How about we get back together?", "Absolutely!", ""]
var clerk_killed_dialog_names = ["", "Bitch Ex", "You", "Bitch Not Ex", ""]

var has_gun_dialog = ["", "What are you going to do, shoot me?"]
var has_gun_dialog_names = ["", "Bitch Ex"]

func speak():
	if $"../..".clerk_killed:
		DialogManager.play_dialog(clerk_killed_dialog, clerk_killed_dialog_names)
		if DialogManager.counter == 4:
			EndingManager.end_game("Please do not use what just happened as relationship advice")
	elif GlobalFlags.gun_grabbed: # But the clerk ISN'T killed...
		DialogManager.play_dialog(has_gun_dialog, has_gun_dialog_names)
	else:
		DialogManager.play_dialog(dialog, dialog_names)
		if DialogManager.counter == 4:
			ObjectiveManager.step_number = "Step 14:"
			ObjectiveManager.instruction = "Cope and seethe"
			GlobalFlags.coping_and_seething = true
			
			$"../../Door".use_collision = true

func die():
	$ComedicTimingTimer.start()
	$Sprite3D.visible = false
	$CollisionShape.disabled = true
	GlobalFlags.ex_killed = true

func _on_ComedicTimingTimer_timeout():
	get_tree().change_scene("res://Levels/Arrested Cutscene/Arrested.tscn")
