extends CharacterBody2D

@export var SPEED = 4
@export var gravity = 3
@export var JUMP_STRENGTH = 6

@onready var ap = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var cshape = $CollisionShape2D

var is_crouching = false

#preloading
var standing_cshape = preload("res://Resources/knight_standing_cshape.tres")
var crouching_cshape = preload("res://Resources/knight_crouching_cshape.tres")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * 10
		if velocity.y > 1000:
			velocity.y = 1000

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_STRENGTH * 100

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction := Input.get_axis("move_left", "move_right")
	velocity.x = horizontal_direction * SPEED * 100

	# Handles switching directions
	if horizontal_direction != 0:
		switch_direction(horizontal_direction)
		
	if Input.is_action_just_pressed("crouch"):
		crouch()
	elif Input.is_action_just_released("crouch"):
		stand()

	move_and_slide()
	
	update_animations(horizontal_direction)
	
func update_animations(horizontal_direction):
	if is_on_floor():
		if horizontal_direction == 0:
			if is_crouching:
				ap.play("crouch")
			else:
				ap.play("idle")
		else:
			if is_crouching:
				ap.play("crouch_walk")
			else:
				ap.play("run")
	else:
		if is_crouching:
			if velocity.x == 0:
				ap.play("crouch")
			else:
				ap.play("crouch_walk")
		elif velocity.y < 0:
			ap.play("jump")
		elif velocity.y > 0:
			ap.play("fall")
			
func switch_direction(horizontal_directon):
	sprite.flip_h = (horizontal_directon == -1)
	sprite.position.x = horizontal_directon * 30
	
func crouch():
	if is_crouching:
		return
	is_crouching = true
	cshape.shape = crouching_cshape
	cshape.position.y = -60
		
func stand():
	if is_crouching == false:
		return
	is_crouching = false	
	cshape.shape = standing_cshape
	cshape.position.y = -90
		
	#extends CharacterBody2D
#
#func _physics_process(delta):
	#var horizontal_direction = Input.get_axis("move_left", "move_right")
	#velocity.x = -300 * horizontal_direction
	#move_and_slide()
