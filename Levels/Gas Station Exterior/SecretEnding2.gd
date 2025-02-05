extends Spatial

func _on_Area_body_entered(body):
	if body.name == "Player":
		EndingManager.end_game("You could just play Death Stranding instead, you know?")
