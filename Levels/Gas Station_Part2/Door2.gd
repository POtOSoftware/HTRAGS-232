extends CSGBox

func _ready():
	use_collision = false

func interact():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var chance = rng.randi_range(1, 4)
	
	print(chance)
	
	if $"..".clerk_killed:
		LevelManager.load_level("res://Levels/Arrested Cutscene/Arrested.tscn")
	elif GlobalFlags.coping_and_seething:
		if $"../Counter/Clerk".spooked:
			GlobalFlags.times_robbed += 1
			print("robbed " + str(GlobalFlags.times_robbed))
		LevelManager.load_level("res://Levels/House_Part2/House2.tscn")
	else:
		EndingManager.end_game("You got away with enough money to buy a PS5. Sweet! (Good Ending)")
