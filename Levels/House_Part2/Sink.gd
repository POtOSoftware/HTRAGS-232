extends StaticBody

# If you're wondering why the Unit Db is set to 80, it's because the sound is so quiet it can't be heard
func interact():
	$SinkSFX.play()
