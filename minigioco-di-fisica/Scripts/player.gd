extends CharacterBody2D

const SPEED = 5000


func _physics_process(delta: float) -> void:
	
	
	if Input.is_action_pressed("Destra"):
		velocity.x = (SPEED*delta)
	elif Input.is_action_pressed("Sinistra"):
		velocity.x = -(SPEED*delta)
	else:
		velocity.x = 0
	
	move_and_slide()
