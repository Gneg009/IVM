extends CharacterBody2D

enum {DOWN, UP, LEFT, RIGHT}

@onready var anim = $AnimatedSprite2D 
var speed = 200
var idle_dir = DOWN
var input_dir = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	input_dir = Input.get_vector("left", "right", "up", "down")
	
	if input_dir != Vector2.ZERO:
		velocity = input_dir * speed
		update_animation(input_dir)
	else:
		velocity = Vector2.ZERO
		idle()
	
	move_and_slide()

func update_animation(dir: Vector2):
	if dir.x > 0:
		anim.flip_h = false
		anim.play("Front")
		idle_dir = RIGHT
	elif dir.x < 0:
		anim.flip_h = true
		anim.play("Front")
		idle_dir = LEFT
	elif dir.y < 0:
		anim.play("Up")
		idle_dir = UP
	elif dir.y > 0:
		anim.play("Down")
		idle_dir = DOWN

func idle():
	match idle_dir:
		DOWN: 
			anim.play("Idle_down")
		UP: 
			anim.play("Idle_up")
		LEFT:
			anim.flip_h = true
			anim.play("Idle_front")
		RIGHT:
			anim.flip_h = false
			anim.play("Idle_front")
