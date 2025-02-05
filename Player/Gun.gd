extends Control

onready var GunRay = $"../../Head/Camera/GunRay"

var enabled = false
var can_fire = true

func _ready():
	GlobalFlags.player_gun = self

func _exit_tree():
	GlobalFlags.player_gun = null

func _physics_process(delta):
	visible = enabled
	
	var target = GunRay.get_collider()
	if GunRay.is_colliding() and enabled:
		if target.has_method("spook"):
			target.spook()
		# Turns crosshair red to indicate this node can be killed
		if target.has_method("die"):
				$"../Crosshair".color = Color(1, 0, 0, 1)
				# Conveniently, the player's UI code automatically resets the crosshair color
	
	if Input.is_action_just_pressed("fire") and can_fire and enabled:
		$ShotSFX.play()
		if GunRay.is_colliding() and enabled:
			print("Firing at " + str(target))
			if target.has_method("die"):
				$"../Crosshair".color = Color(1, 0, 0, 1)
				target.die()
		can_fire = false
		$Sprite.texture = load("res://Player/Gun_firing.png")
	
	if GlobalFlags.debug:
		if Input.is_action_just_pressed("debug.enable_gun"):
			enabled = not enabled

func _on_ShotSFX_finished():
	can_fire = true
	$Sprite.texture = load("res://Player/Gun.png")
