@icon("res://Icons/node_2D/icon_bullet.png")
extends CharacterBody2D

var velocita = 900
var direzione: Vector2 = Vector2(0,0)
var bersaglio: CharacterBody2D

func _process(delta: float) -> void:
	velocity = velocita * position.direction_to(direzione)
	if velocity.length() > 0:
		rotation = velocity.angle() + deg_to_rad(90)  
	
	move_and_slide()

func _on_auto_distruzione_timeout() -> void:
	distruzione()

func distruzione():
	queue_free()

func _on_radar_body_entered(body: Node2D) -> void:
	if body == bersaglio:
		body.distruggiCavaliere()
		distruzione()
