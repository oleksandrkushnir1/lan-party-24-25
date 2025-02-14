extends Control
@onready var tempo_impiegato: Label = $Card/TempoTab/DescriptionTempo/containerdati/TempoImpiegato
@onready var bricoguadagnati: Label = $Card/CoinTab/DescriptionBricoCoin/containerdati/Bricoguadagnati
@onready var punteggioottenuto: Label = $Card/PointTab/Descriptionpunteggio/containerdati/punteggioottenuto

@onready var titolo: Label = $TitoloSprite/titolo

@onready var bottonedes: TextureButton = $bottonedes

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	compila_scheda(randi_range(100,200))
	
func compila_scheda(tempoInt:int, Vittoria: bool = false):
	get_tree().paused = true
	$".".visible = true
	var text = func():
		if !Vittoria:
			return "sconfitta"
		return "vittoria"
	titolo.text = text.call()
	tempo_impiegato.text = str(tempoInt)
	bricoguadagnati.text = str(randi_range(100,400))
	punteggioottenuto.text = str(randi_range(1000,6000))
	animation_player.play("apparizione")
	
func cancella_menu():
	animation_player.play_backwards("apparizione")
	await animation_player.animation_finished
	queue_free()

func _on_bottonedes_pressed() -> void:
	cancella_menu()
