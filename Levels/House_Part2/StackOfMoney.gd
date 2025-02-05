extends Spatial

export (int, 0, 22) var stacks_visible

func _ready():
	if GlobalFlags.times_robbed > 22:
		GlobalFlags.times_robbed = 22
	
	stacks_visible = GlobalFlags.times_robbed
	for i in range(stacks_visible):
		i = i + 1
		get_node("Stack" + str(i)).visible = true 
