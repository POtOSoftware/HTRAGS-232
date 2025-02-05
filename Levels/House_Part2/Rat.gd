extends StaticBody

func die():
	GlobalFlags.rats_killed += 1 
	print("I'm gonna have to call PETA on your ass")
	queue_free()
