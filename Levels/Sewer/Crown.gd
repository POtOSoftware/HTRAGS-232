extends StaticBody

func interact():
	if $"..".wall_moving:
		$"../../AnimationPlayer".play_backwards("RatMigration")
		$Crown.visible = false
		$CollisionShape.disabled = true
	else:
		EndingManager.end_game("You are now the rat king. No this does not mean a rat king sequel")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "RatMigration":
		EndingManager.end_game("Since you're king rat now, the rats decided to not kill you")
