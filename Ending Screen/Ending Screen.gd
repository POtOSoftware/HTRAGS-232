extends Control

var can_continue = false

var key_presses : int

func _ready():
	if OS.get_name() == "Android":
		$Input.text = "Tap Screen To Continue"
	if OS.get_name() == "Vita":
		$Input.text = "Press Any Button To Continue"
	
	$Time.visible = false
	var tex = ImageTexture.new()
	tex.create_from_image(EndingManager.screenshot())
	$Background.texture = tex
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$AnimationPlayer.play("EndScreen")
	$"Ending Quote".text = EndingManager.ending_quote
	if GlobalFlags.speedrun_mode:
		$Time.visible = true
		$"Time".text = "Time: " +  SpeedrunTimer.time_passed

func _unhandled_input(event):
	if event.is_pressed():
		key_presses += 1
		if can_continue:
			$AnimationPlayer.play("FadeOut")
		else:
			print("Holy SHIT you're impatient")
			if key_presses >= 10:
				print("Fine then, asshole")
				get_tree().change_scene("res://Main Menu/Main Menu.tscn")

func _on_PlzWaitTimer_timeout():
	can_continue = true

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FadeOut":
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")
