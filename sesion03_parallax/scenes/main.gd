extends MarginContainer


@export var crafting_board:GridContainer
@export var inventory:GridContainer

@export var save_button:Button
@export var settings_button:Button

var inventory_file = "user://game.data"


func _ready () -> void:
	load_config()
	load_inventory()


func _on_inventory_item_selected(item_data: ItemData) -> void:
	crafting_board.add_item(item_data)


func _on_crafting_board_recipe_crafted(item_data: ItemData) -> void:
	inventory.add_item_data(item_data)


func save_inventory (datos:Dictionary) -> void:
	var datos_json = JSON.stringify(datos)

	var file = FileAccess.open_encrypted_with_pass(inventory_file, FileAccess.WRITE, "todogodot")

	file.store_string(datos_json)


func load_inventory () -> void:
	if not FileAccess.file_exists(inventory_file):
		print("Error al cargar el archivo de inventario")
		return

	var file = FileAccess.open_encrypted_with_pass(inventory_file, FileAccess.READ, "todogodot")
	
	var data_json = file.get_as_text()
	
	var inventory_list = JSON.parse_string(data_json)
	
	for item in inventory_list.items:
		inventory.add_item(item)


func _on_save_button_pressed() -> void:
	var date_time = Time.get_datetime_dict_from_system()

	var date = "%02d-%02d-%04d" % [date_time["day"], date_time["month"], date_time["year"]]

	var inventario:Dictionary = {
		"date": date,
		"items": inventory.inventory_list
	}
	
	save_inventory(inventario)



func save_config ():
	var config = ConfigFile.new()
	
	config.set_value("window", "width", 1080)
	config.set_value("window", "height", 1920)
	config.set_value("window", "fullscreen", false)
	config.set_value("language", "language", "es")
	
	config.save("user://invent-ori.conf")


func load_config ():
	var config = ConfigFile.new()
	
	
	
	var configuration = {
		"width":0,
		"height":0,
		"fullscreen": false,
		"language": "es"
	}
	
	if config.load("user://invent-ori.conf") != OK:
		print("Error no hay archivo de configuración")
		return
	
	configuration.width = config.get_value("window", "width")
	configuration.height = config.get_value("window", "height")
	configuration.fullscreen = config.get_value("window", "fullscreen")
	
	print(configuration)


func _on_settings_button_pressed() -> void:
	save_config()
