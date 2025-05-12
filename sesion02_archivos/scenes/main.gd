extends MarginContainer


@export var crafting_board:GridContainer
@export var inventory:GridContainer

@export var save_button:Button
@export var settings_button:Button


func _on_inventory_item_selected(item_data: ItemData) -> void:
	crafting_board.add_item(item_data)


func _on_crafting_board_recipe_crafted(item_data: ItemData) -> void:
	inventory.add_item_data(item_data)
