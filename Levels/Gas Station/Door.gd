extends CSGBox

var current_objective = false
var rng = RandomNumberGenerator.new()

func interact():
	if $"../Counter/Clerk".clerk_talked_to == false:
		rng.randomize()
		EndingManager.end_game("Sigma Grindset Rule #" + str(rng.randi_range(1, 42069)) + ": Just steal shit.")
	else:
		LevelManager.load_level("res://Levels/House_Part2/House2.tscn")
