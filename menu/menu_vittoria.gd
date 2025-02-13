extends Control
@onready var tempo_impiegato: Label = $Control/TempoTab/DescriptionTempo/containerdati/TempoImpiegato
@onready var bricoguadagnati: Label = $Control/CoinTab/DescriptionBricoCoin/containerdati/Bricoguadagnati
@onready var punteggioottenuto: Label = $Control/PointTab/Descriptionpunteggio/containerdati/punteggioottenuto

@onready var titolo: Label = $TitoloSprite/titolo

@onready var bottonedes: TextureButton = $bottonedes


func _ready() -> void:
	compila_scheda(randi_range(100,200))

func compila_scheda(tempoInt:int, Vittoria: bool = false):
	var text = func():
		if !Vittoria:
			return "sconfitta"
		return "vittoria"
	titolo.text = text.call()
	tempo_impiegato.text = str(tempoInt)
	bricoguadagnati.text = str(randi_range(100,400))
	punteggioottenuto.text = str(randi_range(1000,6000))
	$AnimationPlayer.play("apparizione")
