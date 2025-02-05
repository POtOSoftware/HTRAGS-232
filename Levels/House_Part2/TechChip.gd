extends StaticBody

func interact():
	GlobalFlags.tech_chip_grabbed = true
	queue_free()
