extends StaticBody

var wall_moving = false

var no_rat_killed_dialog = ["", "Thank you for respecting my people", "To thank you, I shall give you a gift:", "A family size bag of Gamer Chips(TM)!"]
var no_rat_killed_dialog_names = ["", "King Rat"]

var rat_killed_dialog = ["", "You slaugtered my people, now you shall be killed"]
var rat_killed_dialog_names = ["", "King Rat"]

func speak():
	if GlobalFlags.rats_killed == 0:
		DialogManager.play_dialog(no_rat_killed_dialog, no_rat_killed_dialog_names)
		if DialogManager.counter == 3:
			$"../AnimationPlayer".play("GiveChips")
	if GlobalFlags.rats_killed != 0:
		DialogManager.play_dialog(rat_killed_dialog, rat_killed_dialog_names)
		$"../AnimationPlayer".play("RatMigration")
		wall_moving = true

func die():
	$"King Rat".visible = false
	$CollisionShape.disabled = true
	$Crown/CollisionShape.disabled = false
