extends Spatial

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Explosion":
		EndingManager.end_game("Are Michael Bay jokes still a thing?")
