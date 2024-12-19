extends CharacterBody2D

var SPEED = 1000

func _physics_process(delta: float) -> void:
	
	"""
	Questo blocco definisce il movimento.
	Il personaggi si muove solo se "A" O "D" tasto è permuto.
	"""
	if Input.is_action_pressed("Destra"):
		velocity.x = (SPEED*delta)
	elif Input.is_action_pressed("Sinistra"):
		velocity.x = -(SPEED*delta)
	else:
		velocity.x = 0
	
	# Gravità inplementata
	velocity += get_gravity() * delta
	
	move_and_slide()
