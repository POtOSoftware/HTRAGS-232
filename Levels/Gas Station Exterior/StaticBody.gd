extends StaticBody

func die():
	SpeedrunTimer.timer_on = false
	$"../../SecretEnding3/AnimationPlayer".play("Explosion")
	$"../../Player".queue_free()
