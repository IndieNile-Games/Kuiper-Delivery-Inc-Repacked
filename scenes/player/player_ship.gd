extends CharacterBody2D

@export var Bullet : PackedScene
@export var SPEED = 100.0
@export var LERP = 4.5;

var shotLeft = true;

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	if (shotLeft):
		shotLeft = false;
		b.position = $Muzzle/Right.global_position
	else:
		shotLeft = true;
		b.position = $Muzzle/Left.global_position
	$Sprites/MuzzleFlash/Animations.play("Fire Weapon");
	
func _ready() -> void:
	# Initiates the Animation Tree
	$Sprites/ShipBody/Tree.set("parameters/blend_position", 0) 
	$Muzzle/Animator/Tree.set("parameters/blend_position", 0)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire Bullet"):
		shoot()
	
	# Move the ship
	var direction := Input.get_axis("Move Left", "Move Right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, LERP)
	else:
		velocity.x = move_toward(velocity.x, 0, LERP/2)

	# Updates the animator
	$Sprites/ShipBody/Tree.set("parameters/blend_position", velocity.x)
	$Muzzle/Animator/Tree.set("parameters/blend_position", velocity.x)
	move_and_slide() # Slides us around.
