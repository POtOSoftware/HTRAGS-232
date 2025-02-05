extends KinematicBody

var non_objective_dialog = ["", "I don't see any items on the counter", "What? Are you broke?", "Stop staring at me, it's making me uncomfortable", "DUDE! GO GET SOMETHING!", "I'm about to call the police", "Hello? 911?", "Yeah, this dude won't leave me alone. Can you send a police car?", "Alright, thanks", "The police are on their way, you're not leaving"]
var non_objective_names = ["", "Store Clerk"]

var dialog = ["", "Sorry, you can't get those", "Why not?", "With shoes like those, you can't afford these chips", "I have my wallet on me, I can-", "Shut up broke boy", "Get out of my store before you lower its property value any further"]
var dialog_names = ["", "Store Clerk", "You", "Store Clerk", "You", "Store Clerk", "Store Clerk"]

var quite_angry_dialog = ["", "Are you deaf? I told you to leave!"]
var quite_angry_names = ["", "Store Clerk"]

var very_angry_dialog = ["", "The police are on their way, you're not leaving"]
var very_angry_names = ["", "Store Clerk"]

var current_objective = false
var quite_angry = false
var very_angry = false
var clerk_talked_to = false

func speak():
	if current_objective:
		DialogManager.play_dialog(dialog, dialog_names)
		if DialogManager.counter == 6:
			current_objective = false
			quite_angry = true
	elif quite_angry:
		DialogManager.play_dialog(quite_angry_dialog, quite_angry_names, true)
		
		ObjectiveManager.step_number = "Step 10:"
		ObjectiveManager.instruction = "Leave"
		#$"../../Door".use_collision = true
		clerk_talked_to = true
	else:
		if DialogManager.counter == 9:
			EndingManager.end_game("You didn't even rob the store but you got arrested anyways. Nice going dumbass.")
		DialogManager.play_dialog(non_objective_dialog, non_objective_names)
		
