extends StaticBody

func _ready():
	# Check it out. One line. Take THAT YandereDev!
	$CollisionShape.disabled = not GlobalFlags.coping_and_seething

func interact():
	EndingManager.end_game("Cry about it")
