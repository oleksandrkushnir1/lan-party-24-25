extends CharacterBody2D

const SPEED = 10

@onready var timer: Timer = $"../Timer"
@onready var timer_2: Timer = $"../Timer2"
@onready var label = $"../Label"
@onready var label_2 = $"../Label2"

var m = 1
var y = 1
var vf = true
var _vf = true

func _ready() -> void:
	_start()
	label_2.text = "Con la giusta combinazione di cassa e pavimento 
	per ottenere una forza d'attrito di %.3f" % _random_float()

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

func _start() -> void:
	timer_2.start()
	
func _random_float() -> float:
	var int_list = [0.196, 0.736, 1.962, 7.358]
	var random_int = _randomize_float(int_list)
	return random_int

func _randomize_float(list: Array) -> float:
	if list.size() > 0:
		var random_index = randi() % list.size()
		return list[random_index]
	else:
		return 0

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
