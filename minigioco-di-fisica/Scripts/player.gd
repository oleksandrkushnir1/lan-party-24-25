extends CharacterBody2D

const SPEED = 10

@onready var timer: Timer = $"../Timer"
@onready var timer_2: Timer = $"../Timer2"
@onready var label = $"../Label"

var m = 1
var y = 1
var vf = true
var _vf = true

func _physics_process(delta: float) -> void:
	if !timer_2.is_stopped():
		label.visible = false
		if Input.is_action_just_pressed("Conferma"):
			timer.start()

		if !timer.is_stopped():
			velocity.x = ((SPEED - ((m * 9.81) * y)) * 50)
		else:
			velocity.x = 0
	else:
		label.visible = true
	
	# Gravità implementata
	velocity += get_gravity() * delta

	move_and_slide()

func _on_button_button_down() -> void:
	if vf == true:
		vf = false
		m = 0.1
	else:
		vf = true
		m = 1

func _on_button_2_button_down() -> void:
	if _vf == true:
		_vf = false
		y = 0.2
	else:
		_vf = true
		y = 0.75
