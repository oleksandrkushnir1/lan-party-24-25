extends Area2D 
var dragging = false 
var of = Vector2(0,0) 
@export var element_name = "H" 
var game_manager: Node
var sprite = load("res://icon.svg")

func _ready() -> void: 
	game_manager = get_node("/root/Minigiochi/GameManager")
	$Sprite.texture = sprite
	pass 

func _process(delta: float) -> void: 
	if dragging: 
		position = get_global_mouse_position() - of 
func _on_button_button_down() -> void: 
	dragging = true 
	of = get_global_mouse_position() - global_position 
func _on_button_button_up() -> void: 
	dragging = false 


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if game_manager.has_node(area.get_path()) and dragging == true:
		game_manager.handle_collision(self,area)
