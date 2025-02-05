extends Area

func _on_Rat_Wall_body_entered(body):
	if body.name == "Player":
		EndingManager.end_game("While you're up there, can you say hi to my grandpa for me?")
