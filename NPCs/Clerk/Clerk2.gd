extends KinematicBody

var spooked = false

var can_speak = true

var rng = RandomNumberGenerator.new()

var dialog = ["", "GIVE ME THE GOD DAMN MONEY", "A-alright man. I'll give you everything", "Just please... don't hurt me!", "HURRY THE FUCK UP!", "H-here man... h-here's everything! Don't shoot!", "THANK YOU! ASSHOLE!", "$" + str(rng.randi_range(1, 1000)) + " acquired"]
var dialog_names = ["", "You", "Store Clerk", "Store Clerk", "You", "Store Clerk", "You", ""]

var dialog2 = ["", "I only got one bitch. But that's one more bitch than you HAHAHAHAAAA!"]
var dialog_names2 = ["", "Store Clerk"]

func speak():
	if can_speak:
		DialogManager.play_dialog(dialog, dialog_names)
	if not GlobalFlags.gun_grabbed:
			DialogManager.play_dialog(dialog2, dialog_names2, true)
		
	if DialogManager.counter == 7:
			can_speak = false
			
			ObjectiveManager.step_number = "Step 15:"
			ObjectiveManager.instruction = "Leave (again)"
			
			$"../../Door".use_collision = true
	#print(DialogManager.counter)

func spook():
	if spooked:
		pass
	else:
		$Sprite3D.texture = load("res://Levels/Gas Station_Part2/ScaredClerk.png")
		$ScreamSFX.play()
		spooked = true

func die():
	$"../..".clerk_killed() # "../.." is the root node... huh
	queue_free()
