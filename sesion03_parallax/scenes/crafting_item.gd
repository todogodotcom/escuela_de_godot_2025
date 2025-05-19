class_name CraftingItem
extends Button


@export var item_data:ItemData 


func _ready() -> void:
	icon = item_data.texture
	
	button_up.connect(_on_button_up)


func _on_button_up ():
	queue_free()
