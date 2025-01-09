extends RigidBody2D

var vf = true
var anims

func _ready() -> void:
	anims = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Click") and vf == true:
		anims.play("legno")
		vf = false
	elif Input.is_action_just_pressed("Click") and vf == false:
		anims.play("metallo")
		vf = true
