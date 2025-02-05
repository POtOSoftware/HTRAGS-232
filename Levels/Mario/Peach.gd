extends StaticBody

var goombas_not_killed = ["", "plz kill ALL teh goombas 2 save me!!1!"]
var goombas_not_killed_names = ["", "pecch"]

var goombas_killed = ["", "thx 4 saving me!!!11!!!11!!!", "time 4 le epic sex!!!11!", ""]
var goombas_killed_names = ["", "pecch"]

func speak():
	if GlobalFlags.goombas_killed < 16:
		DialogManager.play_dialog(goombas_not_killed, goombas_not_killed_names)
	else:
		DialogManager.play_dialog(goombas_killed, goombas_killed_names)
		if DialogManager.counter == 3:
			EndingManager.end_game("You contracted AIDS and died")

func die():
	$Peach.visible = false
	$NotPeach.visible = true
	$CollisionShape.disabled = true
	$GunCockSFX.play()

func _on_GunCockSFX_finished():
	EndingManager.end_game("Due to a DMCA takedown risk, this ending had to be abrupt so you-know-who doesn't notice")
