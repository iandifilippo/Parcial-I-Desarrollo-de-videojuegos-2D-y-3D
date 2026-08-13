extends CharacterBody2D
@onready var anim = $AnimatedSprite2D
@export var speed = 200.0
@export var jump_force = -500.0

func _ready():
	add_to_group("player")
	$AnimatedSprite2D.play("run")

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	var dir = Input.get_axis("move_left", "move_right")
	velocity.x = dir * speed
	if dir != 0:
		anim.flip_h = dir < 0
		anim.play("walk")
	move_and_slide()
