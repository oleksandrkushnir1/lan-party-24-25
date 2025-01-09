extends CharacterBody2D

const SPEED = 1000
var speed = 1
var vf = true

func _physics_process(delta: float) -> void:
	_massa()
	
	"""
	Questo blocco definisce il movimento.
	Il personaggi si muove solo se "A" O "D" tasto è permuto.
	"""
	if Input.is_action_pressed("Destra"):
		velocity.x = (SPEED*speed*delta)
	elif Input.is_action_pressed("Sinistra"):
		velocity.x = -(SPEED*speed*delta)
	else:
		velocity.x = 0

	# Gravità inplementata
	velocity += get_gravity() * delta
	
	move_and_slide()

func _massa() -> void:
	if Input.is_action_just_pressed("Click") and vf == true:
		vf = false
		speed *= 10
	elif Input.is_action_just_pressed("Click") and vf == false:
		vf = true
		speed = 1
