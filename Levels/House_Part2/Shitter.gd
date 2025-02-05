extends StaticBody

func die():
	$"../SewageGrate".visible = true
	$"../SewageGrate/SecretSFX".play()
	queue_free()
