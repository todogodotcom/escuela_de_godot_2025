class_name Item
extends Button


signal item_selected (item_data:ItemData)


@export var item_data:ItemData 


func _ready() -> void:
	icon = item_data.texture
	
	button_up.connect(_on_button_up)
	
	
func _on_button_up ():
	item_selected.emit(item_data)
