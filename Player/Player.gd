extends KinematicBody

export var speed : int = 10
var h_acceleration = 6
var gravity = 20
var jump = 10

var mouse_sensitivity = SettingsManager.mouse_sensitivity
var joystick_sensitivity = 3

var direction = Vector3()
var h_velocity = Vector3()
var movement = Vector3()
var gravity_vec = Vector3()

# These are literally just here for the opening
var can_look = true
var can_move = true

var use_key = SettingsManager.use_key
var use_key_text

const JOY_DEADZONE = 0.2
const JOY_AXIS_RESCALE = 1.0/(1.0-JOY_DEADZONE)
const JOY_ROTATION_MULTIPLIER = 200.0 * PI / 180.0

onready var head = $Head
onready var camera = $Head/Camera
onready var interaction_ray = $Head/Camera/InteractionRay

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	camera.fov = SettingsManager.camera_fov
	
	match use_key:
		0:
			use_key_text = "E"
		1:
			use_key_text = "LMB"
		2:
			use_key_text = "RMB"
		3:
			use_key_text = "MMB"
		_:
			# If the value isn't set, the settings likely weren't even changed so E is a good default
			use_key_text = "E"
	
	if OS.get_name() == "Vita":
		use_key_text = "SQUARE"
	if OS.get_name() == "Android":
		$UI/MobileControls.visible = true
	
	$UI/MobileControls/DebugMenu.visible = GlobalFlags.debug

func _input(event):
	# Disable mouse look on Android so that the camera isn't moved while using the virtual joystick
	if OS.get_name() != "Android":
		if event is InputEventMouseMotion:
			if can_look:
				rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
				head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))
	
	# Just copying and pasting the above code but under a fresh new if statement! I'm not sure why this works the way I want it to, but it does so I don't care
	if event is InputEventScreenDrag:
		if can_look:
			rotate_y(deg2rad(-event.relative.x * mouse_sensitivity*2))
			head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity*2))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))

func _physics_process(delta):
	# Set crosshair color to black when looking at interactable object
	if interaction_ray.is_colliding():
		var object = interaction_ray.get_collider()
		if object.has_method("interact"):
			$UI/Crosshair.color = Color(0, 0, 0, 1)
			$UI/InteractionHint.visible = true
			if OS.get_name() == "Android":
				$UI/InteractionHint.text = "Interact"
			else:
				$UI/InteractionHint.text = "[%s] Interact" % use_key_text
		elif object.has_method("speak"):
			$UI/Crosshair.color = Color(0, 0, 0, 1)
			$UI/InteractionHint.visible = true
			#$UI/Dialog.visible = true
			if OS.get_name() == "Android":
				$UI/InteractionHint.text = "Speak"
			else:
				$UI/InteractionHint.text = "[%s] Speak" % use_key_text
		else:
			$UI/Crosshair.color = Color(1, 1, 1, 1)
			$UI/Dialog.visible = false
			$UI/InteractionHint.visible = false
	else:
		$UI/Crosshair.color = Color(1, 1, 1, 1)
		$UI/Dialog.visible = false
		$UI/Dialog/Arrow.visible = true
		$UI/InteractionHint.visible = false
		DialogManager.counter = 0
		DialogManager.name_counter = 0
	
	#print(gravity_vec)
	direction = Vector3()
	
	if not is_on_floor():
		# Some weird bullshit makes it to where the game pisses its pants and makes you float up
		# Instead of fixing it, I'll just design the levels so this won't happen
		gravity_vec += Vector3.DOWN * gravity * delta
	else:
		gravity = -get_floor_normal() * gravity
		
	if can_move:
		if Input.is_action_pressed("move_forward"):
			direction -= transform.basis.z
		elif Input.is_action_pressed("move_backward"):
			direction += transform.basis.z
		
		if Input.is_action_pressed("move_left"):
			direction -= transform.basis.x
		elif Input.is_action_pressed("move_right"):
			direction += transform.basis.x
	
	# Controller camera movement
	if can_look:
		var xAxis = Input.get_joy_axis(0, JOY_AXIS_2)
		if abs(xAxis) > JOY_DEADZONE:
			if xAxis > 0:
				xAxis = (xAxis-JOY_DEADZONE) * JOY_AXIS_RESCALE
			else:
				xAxis = (xAxis+JOY_DEADZONE) * JOY_AXIS_RESCALE
			rotate_object_local(Vector3.UP, -xAxis * delta * JOY_ROTATION_MULTIPLIER)
		
		var yAxis = Input.get_joy_axis(0, JOY_AXIS_3)
		if abs(yAxis) > JOY_DEADZONE:
			if yAxis > 0:
				yAxis = (yAxis-JOY_DEADZONE) * JOY_AXIS_RESCALE
			else:
				yAxis = (yAxis+JOY_DEADZONE) * JOY_AXIS_RESCALE
			head.rotate_object_local(Vector3.RIGHT, -yAxis * delta * JOY_ROTATION_MULTIPLIER)
			head.rotation.x = clamp(head.rotation.x, -1.0, 1.0)
	
	# Interact with shit
	if Input.is_action_just_pressed("use"):
		if interaction_ray.is_colliding():
			var object = interaction_ray.get_collider()
			print("Interacting with " + object.get_name())
			# Any object with the interact() function is interactable... obviously, and runs the interact() function in it
			if object.has_method("interact"):
				object.interact()
			if object.has_method("speak"):
				$UI/Dialog.visible = true
				object.speak()
	
	if Input.is_action_just_pressed("ui_accept"):
		Engine.set_time_scale(1.0)
	
	if Input.is_action_just_pressed("reset") and GlobalFlags.speedrun_mode:
		SpeedrunTimer.timer_on = false
		SpeedrunTimer.time = 0
		LevelManager.load_level("res://Levels/House/House.tscn")
	
	#if Input.is_action_pressed("ui_cancel"):
	#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#	get_tree().change_scene("res://Main Menu/Main Menu.tscn")
	
	# If the player presses escape to release the cursor, this code can get it back if they click
	if Input.is_action_just_pressed("fire") and OS.get_name() == "HTML5":
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	direction = direction.normalized()
	h_velocity = h_velocity.linear_interpolate(direction * speed, h_acceleration * delta)
	movement.z = h_velocity.z + gravity_vec.z
	movement.x = h_velocity.x + gravity_vec.x
	movement.y = gravity_vec.y
	
	move_and_slide(movement, Vector3.UP)
