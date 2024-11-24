extends Node

var element_scene = preload("res://scene/elemento.tscn")
var task_scene = preload("res://scene/task.tscn") 
# Punti di spawn
var tasks = ["Ossigeno",'Acqua']
var taskTracker = []
var formulaLVL1 = {"Acqua" : "H2 + ?", "Ossigeno" : "O + ?"}
var formulaLVL2 = {"Acqua" : "H2 + O", "Ossigeno" : "O + O"}
var bho : Node2D
var assets = {
	"Idrogeno": load("res://assets/Hydrogen_(element).svg"), 
	"Ossigeno" : load("res://assets/oxygen-4300494_960_720 (1).svg"), 
	"O2": load("res://assets/1000_F_341714736_Q2Wsmxi5004XtIgYHPjrcyRU9JoRzPgF.jpg"),
	"Acqua" : load("res://assets/acqua.png")
	}
var combinazioni = { 
	"Acqua": ["Idrogeno", "O2"], 
	"O2": ["Ossigeno", "Ossigeno"] 
	}
var spawn_points = []
# Numero iniziale di elementi da spawnare
var initial_count = 10
var instance = element_scene.instantiate()
var instanceTasks = task_scene.instantiate()
var position : Vector2
func _ready():
	taskTracker = [spawn_task(Vector2(0, 100), "Ossigeno"),spawn_task(Vector2(0, 200), "Acqua"),spawn_task(Vector2(0, 300), "Acqua") ]

func spawn_element(position: Vector2, name):
	instance = element_scene.instantiate()
	instance.global_position = position
	instance.name = "Element_" + str(instance.get_instance_id())
	instance.element_name = name
	instance.sprite = assets[name]
	add_child(instance)
	for i in range(taskTracker.size()):
		print(taskTracker[i])
		bho = taskTracker[i]
		if bho.base == name:
			taskTracker[i].completato = true
	

func spawn_task(posizione: Vector2, name) -> Node2D:
	instanceTasks = task_scene.instantiate()
	instanceTasks.lvl1 = formulaLVL1[name]
	instanceTasks.lvl2 = formulaLVL2[name]
	instanceTasks.base = name
	instanceTasks.position = posizione
	add_child(instanceTasks)
	return instanceTasks
	
func handle_collision(node1: Node2D, node2: Node2D) -> void: 
	print("Collision detected between elements with IDs: ", node1.element_name, " and ", node2.element_name)
	for new_element in combinazioni:
		var pair = combinazioni[new_element]
		if(node1.element_name == pair[0] and node2.element_name == pair[1]) or (node1.element_name == pair[1] and node2.element_name == pair[0]):
			node1.queue_free()
			node2.queue_free()
			spawn_element(node1.position, new_element)


func _on_button_button_down() -> void:
	spawn_element(Vector2(180,300), "Ossigeno")
	pass # Replace with function body.

func _on_button_2_button_down() -> void:
	spawn_element(Vector2(300,300), "Idrogeno")
	pass # Replace with function body.
