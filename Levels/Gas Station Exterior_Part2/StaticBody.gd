extends StaticBody

func die():
	$"../../SecretEnding3/AnimationPlayer".play("Explosion")
	$"../../Player".queue_free()
