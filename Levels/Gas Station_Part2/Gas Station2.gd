extends Spatial

var clerk_killed = false

func _init():
	if GlobalFlags.coping_and_seething and GlobalFlags.gun_grabbed:
		ObjectiveManager.step_number = "Step 17:"
		ObjectiveManager.instruction = "You know what to do"
	elif not GlobalFlags.gun_grabbed:
		ObjectiveManager.step_number = "Step 13:"
		ObjectiveManager.instruction = "Who's this?"
	else:
		ObjectiveManager.step_number = "Step 14:"
		ObjectiveManager.instruction = "Rob that asshat"
		
func _ready():
	if GlobalFlags.gun_grabbed:
		$"Player/UI/Gun".enabled = true
	if not GlobalFlags.gun_grabbed or GlobalFlags.coping_and_seething:
		$"Counter/BitchEx".visible = true
		$"Counter/BitchEx/CollisionShape".disabled = false

func clerk_killed():
	if not GlobalFlags.coping_and_seething:
		ObjectiveManager.step_number = "Reflect:"
		ObjectiveManager.instruction = "Your actions have consequenses"
		$SirensSFX.play()
		$SirensSFX/AnimationPlayer.play("RisingVolume")
		$ReflectionTimer.start()
		$"Door".use_collision = true
	clerk_killed = true

func _on_ReflectionTimer_timeout():
	EndingManager.end_game("Oh my god! You killed the clerk! You bastard!")
