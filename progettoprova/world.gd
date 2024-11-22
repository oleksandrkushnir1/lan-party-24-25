extends Node2D

const port = 8888
var player = preload("res://player.tscn")
@onready var menu = $Canvas

var enet_peer = ENetMultiplayerPeer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func crea_host() -> void:
	#istanzio enet peer e connetto il signal per spawnare il client
	enet_peer.create_server(port)
	multiplayer.multiplayer_peer = enet_peer
	#connetto al signal del server che quando si connette un client lo fa spawnare
	multiplayer.peer_connected.connect(spawna_client)
	#istanzio il player e gli do un id
	spawna_client(multiplayer.get_unique_id())


func crea_client() -> void:
	#connetto il client al server
	enet_peer.create_client("localhost", port)
	multiplayer.multiplayer_peer = enet_peer

	
func spawna_client(id) -> void:
	#spawno il client sul server
	var player = player.instantiate()
	player.name = str(id)
	add_child(player)

# TODO per testare client e host, da togliere quando creiamo una lobby per giocare 
func _on_host_pressed() -> void:
	menu.hide()
	crea_host()


func _on_client_pressed() -> void:
	menu.hide()
	crea_client()
