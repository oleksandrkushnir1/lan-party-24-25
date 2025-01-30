extends RigidBody2D

var vf = true
var anims

func _ready() -> void:
	anims = $AnimatedSprite2D

"""
Questo blocco permette al personaggio di cambiare il materiale della cassa.
Quando premo il pulsante passa da legno a metallo e viceversa.
"""
func _on_button_2_button_down() -> void:
	if vf == true:
		anims.play("legno")
		vf = false
	else: 
		anims.play("metallo")
		vf = true
