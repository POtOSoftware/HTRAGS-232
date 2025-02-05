extends Spatial

func _ready():
	$Credits/AnimationPlayer.play("Credits")

func _unhandled_input(event):
	if event.is_pressed():
		get_tree().change_scene("res://Main Menu/Main Menu.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
