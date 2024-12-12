extends Node2D


var lvl1 : String
var lvl2 : String
var counterlvl = 0
var base : String
var completato = false
var open = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = base
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if completato == true:
		$Label.text = "completato"
		$Button.hide()
	pass


func _on_button_button_down() -> void:
	counterlvl = counterlvl + 1
	if(counterlvl == 1):
		$Label.text = $Label.text + " --> " +lvl1 
	else:
		$Label.text = base + " --> " + lvl2
		$Button.hide()
	pass # Replace with function body.


func _on_scomparsa_button_down() -> void:
	if(open):
		self.move_local_x(400)
		open = false;
	else:
		self.move_local_x(-400)
		open = true;
	pass # Replace with function body.
