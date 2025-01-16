extends CharacterBody2D

const SPEED = 1000
var speed = 1
var _speed = 1
var fiction = 1
var vf = true

func _physics_process(delta: float) -> void:
	_massa()
	_coefAttritto()
	
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
Questo blocco definisce il la massa.
Il personaggio varia la sua velocita simulando una cassa più pesante.
L'animazione cassa si alterna al click sinistro.
"""
func _massa() -> void:
	if Input.is_action_just_pressed("ClickS") and vf == true:
		vf = false
		speed = 10
	elif Input.is_action_just_pressed("ClickS") and vf == false:
		vf = true
		speed = 1

"""
Questo blocco definisce il la massa.
Il personaggio varia la sua velocita simulando una cassa più pesante.
L'animazione cassa si alterna al click destro.
"""
func _coefAttritto() -> void:
	if Input.is_action_just_pressed("ClickD") and vf == true:
		vf = false
		_speed = 8
	elif Input.is_action_just_pressed("ClickD") and vf == false:
		vf = true
		_speed = 2.5
