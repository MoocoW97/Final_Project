extends CharacterBody2D

const speed = 330
@onready var animated_sprite = $AnimatedSprite2D

var input_movement = Vector2()

func _process(delta):
	movement(delta)
	
func movement(delta):
	animation()
	input_movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_movement != Vector2.ZERO:
		velocity = input_movement * speed
	if input_movement == Vector2.ZERO:
		velocity = Vector2.ZERO
	
	#velocity = velocity.normalized()
	move_and_slide()

func animation():
	if input_movement != Vector2.ZERO:
		if input_movement.x > 0:
			animated_sprite.play("run")
			animated_sprite.flip_h = false
		if input_movement.x < 0:
			animated_sprite.play("run")
			animated_sprite.flip_h = true
		if input_movement.y > 0:
			animated_sprite.play("run")
		if input_movement.y < 0:
			animated_sprite.play("run")
	
	if input_movement == Vector2.ZERO:
		animated_sprite.play("idle")
