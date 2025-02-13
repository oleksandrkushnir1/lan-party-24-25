extends Control

@onready var descrizione: Label = $VBoxContainer/Descrizione
@onready var tempo: Label = $VBoxContainer/tempo
@onready var soldi: Label = $VBoxContainer/soldi
@onready var punteggio: Label = $VBoxContainer/punteggio
@onready var titolo: Label = $TitoloSprite/titolo

@onready var bottonesin: TextureButton = $NinePatchRect/buttons/bottonesin
@onready var bottonedes: TextureButton = $NinePatchRect/buttons/bottonedes

func _ready() -> void:
	compila_scheda(100,
	 "Hai vinto complimenti, Il gioco di Stroia è stato completato con le seguenti statistiche",
	 false)

func compila_scheda(tempoInt:int, testoDescrizione:String, Vittoria: bool = true):
	if Vittoria:
		titolo.text = "VITTORIA!"
	else:
		titolo.text = "Sconfitta"
		
	descrizione.text = testoDescrizione
	tempo.text = "hai impiegato: " + str(tempoInt)+ " secondi"
	
	soldi.text = "hai guadagnato: " +str(randi_range(1,120)) + " BricoCoin"
	punteggio.text = "hai totalizzato: " + str(randi_range(1000,4667))+ " Punti"
	
	$AnimationPlayer.play("apparizione")
