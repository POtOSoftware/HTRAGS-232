extends StaticBody

func interact():
	$MicrowaveSFX.play()

func die():
	$MicrowaveSprite.visible = false
	$CollisionShape.disabled = true
	
	$TechChip.visible = true
	$TechChip/CollisionShape.disabled = false
