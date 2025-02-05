extends KinematicBody

var death_sfx = ["res://Levels/Mario/DeathSFX/Glass1.wav",
				"res://Levels/Mario/DeathSFX/Glass2.wav",
				"res://Levels/Mario/DeathSFX/Glass3.wav",
				"res://Levels/Mario/DeathSFX/Glass4.wav",
				"res://Levels/Mario/DeathSFX/Glass5.wav",
				"res://Levels/Mario/DeathSFX/Glass6.wav",
				"res://Levels/Mario/DeathSFX/Glass7.wav",
				"res://Levels/Mario/DeathSFX/Glass8.wav",
				"res://Levels/Mario/DeathSFX/Glass9.wav",
				"res://Levels/Mario/DeathSFX/Glass10.wav",
				"res://Levels/Mario/DeathSFX/Glass11.wav"]

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	$DeathSFX.stream = load(death_sfx[rng.randi_range(0, 10)])

func die():
	GlobalFlags.goombas_killed += 1
	print(GlobalFlags.goombas_killed)
	$Sprite3D.visible = false
	$CollisionShape.disabled = true
	$DeathSFX.playing = true

func _on_DeathSFX_finished():
	queue_free()
