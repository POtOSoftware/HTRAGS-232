extends Spatial

# This is redundant.
# I wanted to fix the "flicker" when it changes the text from its default values once the scene loads
# It didn't work. At least for me
func _init():
	if GlobalFlags.coping_and_seething:
		ObjectiveManager.step_number = "Step 14:"
		ObjectiveManager.instruction = "Cope and seethe"
