extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_force = 250

@onready var animated_sprite = $AnimatedSprite2D

var active = true

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500
	var direction = 0
	if active == true:
		if Input.is_action_just_pressed("jump"): # && is_on_floor():
			jump(jump_force)
		
		direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	if velocity.x > 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true
	
	move_and_slide()
	
	update_animations(direction)

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")

func jump(force):
	velocity.y = -force
