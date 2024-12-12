extends Node

var element_scene = preload("res://scene/elemento.tscn")
var task_scene = preload("res://scene/task.tscn") 
# Punti di spawn
var tasks = ["Anidride carbonica",'Acqua',"Metano","Sodio cloruro(sale da cucina)","Ammoniaca","Acido cloridrico"]
var taskTracker = []
var formulaLVL1 = {
	"Acqua" : "H2 + ?", 
	"Anidride carbonica" :  "C + ?", 
	"Metano" : "C? + H2", 
	"Sodio cloruro(sale da cucina)" : "Na + ?",
	"Ammoniaca" : "NH2 + ?", 
	"Acido cloridrico" : "H + ?"
}
var formulaLVL2 = {
	"Acqua" : "H2 + O", 
	"Anidride carbonica" : "C + O2", 
	"Metano" : "CH2 + H2", 
	"Sodio cloruro(sale da cucina)" : "Na + Cl",
	"Ammoniaca" :"NH2 + H", 
	"Acido cloridrico" : "H + Cl"
	}
var bho : Node2D
var assets = {
	"H": load("res://assets/Elementi/Idrogeno.png"), 
	"O" : load("res://assets/Elementi/Ossigeno.png"), 
	"C": load("res://assets/Elementi/Carbonio.png"), 
	"Cl" : load("res://assets/Elementi/Cloro.png"), 
	"N": load("res://assets/Elementi/Azoto.png"), 
	"S" : load("res://assets/Elementi/Zolfo.png"), 
	"K": load("res://assets/Elementi/Potassio.png"), 
	"Na" : load("res://assets/Elementi/Sodio.png"), 
	"Acqua" : load("res://assets/Task/Acqua.png"),
	"Anidride carbonica" : load("res://assets/Task/AnidrideCarbonica.png"),
	"Metano":load("res://assets/Task/Metano.png")
	}
var combinazioni = { 
	"Acqua": ["H2", "O"], 
	"H2": ["H", "H"],
	"O2": ["O", "O"] ,
	"Anidride carbonica" : ["C", "O2"],
	"Monossido di carboni/CO" : ["C","O"],
	"Anidride carbonica2" : ["Monossido di carboni/CO","O"],
	"Metilene/CH2" : ["C", "H2"],
	"Metano" : ["Metilene/CH2","H2"],
	"Sodio cloruro(sale da cucina)" : ["Na","Cl"],
	"Ammoniaca": ["Ione ammoniuro/NH2","H"],
	"Ione ammoniuro/NH2" : ["N","H2"],
	"Acido cloridrico" : ["H", "Cl"],
	"Ozono":["O2","O"],
	"Monossido di Carbonio" : ["C","O"],
	"Cianuro/CN": ["C","N"],
	"Cianuro di potassio": ["K","Cianuro/CN"],
	"Etilene":["Metilene/CH2","Metilene/CH2"]
	}
var spawn_points = []
# Numero iniziale di elementi da spawnare
var initial_count = 10
var instance = element_scene.instantiate()
var instanceTasks = task_scene.instantiate()
var position : Vector2
func _ready():
	taskTracker = [spawn_task(Vector2(0, 100), "Metano"),spawn_task(Vector2(0, 200), "Acqua"),spawn_task(Vector2(0, 300), "Anidride carbonica") ]

func spawn_element(position: Vector2, name):
	instance = element_scene.instantiate()
	instance.global_position = position
	instance.name = "Element_" + str(instance.get_instance_id())
	instance.element_name = name
	if name in assets:
		instance.sprite = assets[name]
	else :
		instance.sprite = load("res://icon.svg")
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




func _on_s_button_down() -> void:
	spawn_element(Vector2(200,300), "S")
	pass # Replace with function body.




func _on_cl_button_down() -> void:
	spawn_element(Vector2(200,300), "Cl")
	pass # Replace with function body.

func _on_na_button_down() -> void:
	spawn_element(Vector2(200,300), "Na")
	pass # Replace with function body.

func _on_k_button_down() -> void: 
	spawn_element(Vector2(200,300), "K")
	pass # Replace with function body.

func _on_n_button_down() -> void:
	spawn_element(Vector2(200,300), "N")
	pass # Replace with function body.

func _on_c_button_down() -> void:
	spawn_element(Vector2(200,300), "C")
	pass # Replace with function body.

func _on_h_button_down() -> void:
	spawn_element(Vector2(200,300), "H")
	pass # Replace with function body.

func _on_o_button_down() -> void:
	spawn_element(Vector2(200,300), "O")
	pass # Replace with function body.
