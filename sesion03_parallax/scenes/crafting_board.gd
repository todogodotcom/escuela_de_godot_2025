extends GridContainer

signal recipe_crafted(item_data:ItemData)

@export var recipes:Recipes

var crafting_item_preload = preload("res://scenes/crafting_item.tscn")


func clear_items ():
	for i in get_children():
		i.queue_free()


func add_item (item_data:ItemData):
	if get_child_count() >= 9:
		clear_items()
	
	var item:CraftingItem = crafting_item_preload.instantiate()
	
	item.item_data = item_data
	
	add_child(item)
	
	await get_tree().create_timer(0.5).timeout
	
	check_recipes()


func check_recipes ():
	var items = get_children()
	for recipe:Recipe in recipes.recipes:
		if items.size() != recipe.items_input.size():
			prints(items.size(), recipe.items_input.size())
			continue
			
		var found:bool = true
		for r in recipe.items_input.size():
			prints(items[r].item_data.name, recipe.items_input[r].name)
			if items[r].item_data.name != recipe.items_input[r].name:
				found = false
				break
		
		if found:
			recipe_crafted.emit(recipe.item_output)
			clear_items()
			return
			 
		
