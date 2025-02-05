extends StaticBody

func _process(delta):
	$CollisionShape.disabled = not visible

func interact():
	LevelManager.load_level("res://Levels/Sewer/Sewer.tscn")
