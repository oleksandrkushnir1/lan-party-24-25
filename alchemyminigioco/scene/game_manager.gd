extends Node

var element_scene = preload("res://scene/elemento.tscn")
# Punti di spawn

var spawn_points = []
# Numero iniziale di elementi da spawnare
var initial_count = 10

func _ready():
	for i in range(initial_count):
		spawn_element(Vector2(0, 0))

func spawn_element(position: Vector2):
	var instance = element_scene.instantiate()
	instance.global_position = position
	add_child(instance)
