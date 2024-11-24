extends Node2D


var lvl1 : String
var lvl2 : String
var counterlvl = 0
var base : String
var completato = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = base
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if completato == true:
		$Label.text = "completato"
	pass


func _on_button_button_down() -> void:
	counterlvl = counterlvl + 1
	if(counterlvl == 1):
		$Label.text = $Label.text + " --> " +lvl1 
	else:
		$Label.text = base + " --> " + lvl2
		$Button.hide()
	pass # Replace with function body.
