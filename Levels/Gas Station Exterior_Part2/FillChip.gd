extends StaticBody

func _ready():
	$CollisionShape.disabled = not GlobalFlags.tech_chip_grabbed
	$CollisionShape2.disabled = not GlobalFlags.tech_chip_grabbed

func interact():
	GlobalFlags.tech_chip_filled = true
	$Message.visible = true
	$Message/HideTimer.start()

func _on_HideTimer_timeout():
	# We don't need this anymore
	$Message.queue_free()
