extends StaticBody

func _ready():
	visible = false
	$CollisionShape.disabled = true

func interact():
	ObjectiveManager.step_number = "Step 6:"
	ObjectiveManager.instruction = "Go to gas station"
	
	get_node("../Architecture/Front Door").use_collision = true
	
	queue_free()
