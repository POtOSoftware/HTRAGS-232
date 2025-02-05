extends CanvasLayer

signal scene_changed()

func load_level(path):
	GlobalFlags.loading = true
	visible = true 
	print("Loading Level: " + path)
	# On some Android phones (maybe all, idk) it takes a few seconds to compile all the shaders
	# Actually loading the scene is pretty much instant, so by adding this quick little pause it guarantees that the loading screen is shown so people don't think their device froze
	yield(get_tree().create_timer(0.1), "timeout")
	var err = get_tree().change_scene(path)
	if err == OK:
		get_tree().change_scene(path)
		print("successfully loaded " + path)
	else:
		print("Failed to load " + path + " Error Code " + str(err))
	visible = false
	GlobalFlags.loading = false
