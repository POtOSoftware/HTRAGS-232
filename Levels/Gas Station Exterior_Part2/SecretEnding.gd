extends Spatial

func _on_Area_body_entered(body):
	EndingManager.end_game("Yes, that's a bug. No, it's not getting fixed.")
