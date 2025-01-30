extends CharacterBody2D

const SPEED = 1000
var speed = 1
var _speed = 1
var fiction = 1
var vf = true
var _vf = true

func _physics_process(delta: float) -> void:
	"""
	Questo blocco definisce il movimento.
	Il personaggio si muove solo se "A" O "D" tasto è permuto.
	"""
	if Input.is_action_pressed("Destra"):
		velocity.x = (SPEED*speed*_speed*delta)
	elif Input.is_action_pressed("Sinistra"):
		velocity.x = -(SPEED*speed*_speed*delta)
	else:
		velocity.x = 0

	# Gravità inplementata
	velocity += get_gravity() * delta
	
	move_and_slide()

"""
Questo blocco permette al personaggio di cambiare velocità.
Quando premo il pulsante passa da velocità *2.5 a *8 e viceversa.
"""
func _on_button_button_down() -> void:
	if vf == true:
		vf = false
		_speed = 2.5
	else:
		vf = true
		_speed = 8

"""
Questo blocco permette al personaggio di cambiare velocità.
Quando premo il pulsante passa da velocità *10 a *1 e viceversa.
"""
func _on_button_2_button_down() -> void:
	if _vf == true:
		_vf = false
		speed = 10
	else:
		_vf = true
		speed = 1
