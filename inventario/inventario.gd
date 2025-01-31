extends Node

var json_data = load_json_file("res://weapons.json")

func load_json_file(file_path: String) -> Dictionary:
	var file := FileAccess.open(file_path, FileAccess.READ)
	if not file:
		printerr("Errore nell'apertura del file: ", file_path)
		return {}
	
	var content := file.get_as_text()
	file.close()
	
	var json := JSON.new()
	var error := json.parse(content)
	
	if error != OK:
		printerr("Errore nel parsing del JSON: ", error)
		return {}
	
	var data = json.get_data()
	if typeof(data) != TYPE_DICTIONARY:
		printerr("Il file JSON non contiene un dizionario valido.")
		return {}
	return data
	
func get_arma(nomeArma: String)->Dictionary:
	return json_data[nomeArma]
