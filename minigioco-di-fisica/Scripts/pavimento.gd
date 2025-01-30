extends RigidBody2D

var vf = true
var anims

func _ready() -> void:
	anims = $AnimatedSprite2D

"""
Questo blocco permette al personaggio di cambiare il materiale del pavimento.
Quando premo il pulsante passa da ghiaia a giaccio e viceversa.
"""
func _on_button_button_down() -> void:
	if vf == true:
		anims.play("ghiaia")
		vf = false
	else:
		anims.play("ghiaccio")
		vf = true
