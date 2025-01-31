extends Node

@export var nomeArma: String = ""
var arma: Dictionary =  {}

func _ready() -> void:
	if nomeArma == "":
		print_rich("[color=yellow]!!!selezionare l'arma nell'ispettore!!!")
	seleziona_arma(nomeArma)

func seleziona_arma(nomeArma: String):
	arma = Inventario.get_arma(nomeArma)
	print_rich("[color=purple]arma selezionata : [color=pink]", arma.nome)
	
