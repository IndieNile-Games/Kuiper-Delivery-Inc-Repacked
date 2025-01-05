extends Area2D

@export var init_speed = 90
@export var speed_multiplyer = 1.11;

func _ready() -> void:
	$Sprite/Animator.play("Bullet")

func _physics_process(delta):
	position -= transform.y * init_speed * delta
	init_speed *= speed_multiplyer;

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
