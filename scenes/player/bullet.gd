extends Area2D

@export var speed = 300

func _ready() -> void:
	$Sprite/Animator.play("Bullet")

func _physics_process(delta):
	position -= transform.y * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
