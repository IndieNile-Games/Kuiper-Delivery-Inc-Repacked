extends CharacterBody2D

const SPEED = 100.0
const LERP = 4.5;

func _ready() -> void:
	$AnimTree.set("parameters/blend_position", 0) # Initiates the Animation Tree

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, LERP)
	else:
		velocity.x = move_toward(velocity.x, 0, LERP/2)

	$AnimTree.set("parameters/blend_position", velocity.x) # Updates the animator
	move_and_slide() # Slides us around.
