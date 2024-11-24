extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = Color(0, 0, 0, 0) # Colore di sfondo trasparente
	style_box.border_width_top = 0 
	style_box.border_width_bottom = 0 
	style_box.border_width_left = 0 
	style_box.border_width_right = 0 
	style_box.border_color = Color(0, 0, 0, 0) # Colore trasparente 
	
	self.add_theme_stylebox_override("normal", style_box)
	self.add_theme_stylebox_override("pressed", style_box)
	self.add_theme_stylebox_override("hover", style_box) 
	self.add_theme_stylebox_override("disabled", style_box)
	self.add_theme_stylebox_override("focus", style_box)
	pass 
# Replace with function body. 
# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta: float) -> void: 
	pass
