class_name Player extends CharacterBody2D

var speed := 100
var direction : Vector2
var inverse_direction := 1

func _process(delta):
	
	if velocity.x >= 0:
		$Sprite2D.flip_h = false
	else:
		$Sprite2D.flip_h = true
	
	if Input.is_action_pressed("up"):
		$AnimationPlayer.play("walking_up")
	elif velocity != Vector2.ZERO:
		$AnimationPlayer.play("walking_down")
		
	if velocity == Vector2.ZERO:
		$AnimationPlayer.play("idle")

func _physics_process(_delta):
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed * inverse_direction
	move_and_slide()
