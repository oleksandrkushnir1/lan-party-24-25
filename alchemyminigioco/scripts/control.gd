extends Control
var label = Label
var timer = Timer
var text : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $Label2
	timer = $Timer
	
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = int(ceil(timer.time_left))
	if (text >= 70):
		label.text = "1:" + str(text-60)
	elif (text > 60):
		label.text = "1:0" + str(text-60)
	else:
		label.text = str(text)
	pass
