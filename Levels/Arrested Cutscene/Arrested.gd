extends Spatial

func _ready():
	SpeedrunTimer.timer_on = false
	
	if GlobalFlags.tech_chip_filled:
		print("Deez nuts")
		$AnimationPlayer.play("Cutscene_tech_chip")
	elif GlobalFlags.rats_killed == 0:
		print("you got the rat ending broooo")
		$AnimationPlayer.play("Cutscene_Rat")
	else:
		$AnimationPlayer.play("Cutscene")
		
	# If GLES2
	if OS.get_current_video_driver() == 1:
		$WorldEnvironment.environment.ambient_light_energy = 2
	# If GLES3
	else:
		$WorldEnvironment.environment.ambient_light_energy = 5

func _on_AnimationPlayer_animation_finished(anim_name):
	if GlobalFlags.ex_killed:
		print("PEE PEE BUTT AIDS")
		EndingManager.end_game("I would advise AGAINST murdering your ex, as tempting as it may be")
	elif anim_name == "Cutscene_Rat":
		EndingManager.end_game("Since you spared the rats, they helped you escape from the cops! Now enjoy your PS5")
	elif anim_name == "Cutscene_tech_chip":
		EndingManager.end_game("After vaporizing every single cop, you have become president of the universe")
	else:
		EndingManager.end_game("You got arrested and your gun was confiscated. Worst of all you don't have a PS5! (Bad Ending)")
