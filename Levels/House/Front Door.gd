extends CSGBox

func _ready():
	use_collision = false

func interact():
	LevelManager.load_level("res://Levels/Gas Station Exterior/Gas Station Exterior.tscn")
