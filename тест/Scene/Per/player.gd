extends CharacterBody2D

enum {
	DOWN,
	UP,
	LEFT,
	RIGHT
}

@onready var anim = $AnimatedSprite2D 
var speed = 200
var idle_dir = DOWN

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		up_move()
	elif Input.is_action_pressed("down"):
		down_move()
	elif Input.is_action_pressed("left"):
		left_move()
	elif Input.is_action_pressed("right"):
		right_move()
	else:
		idle()
		
	move_and_slide()

func up_move():
	anim.play("Up")
	velocity.x = 0
	velocity.y = -speed
	idle_dir = UP

func down_move():
	anim.play("Down")
	velocity.x = 0
	velocity.y = speed
	idle_dir = DOWN

func left_move():
	anim.flip_h = true
	anim.play("Front")
	velocity.x = -speed
	velocity.y = 0
	idle_dir = LEFT

func right_move():
	anim.flip_h = false
	anim.play("Front")
	velocity.x = speed
	velocity.y = 0
	idle_dir = RIGHT

func idle():
	velocity.x = 0
	velocity.y = 0
	if velocity.x == 0 and velocity.y == 0:
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
