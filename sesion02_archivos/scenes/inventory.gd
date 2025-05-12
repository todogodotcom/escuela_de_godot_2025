extends GridContainer

signal item_selected(item_data:ItemData)

var item_preload = preload("res://scenes/item.tscn")

var items_data = {
	"apple": preload("res://resources/items/apple.tres"),
	"pear": preload("res://resources/items/pear.tres"),
	"peach": preload("res://resources/items/peach.tres"),
	"banana": preload("res://resources/items/banana.tres"),
	"cherry": preload("res://resources/items/cherry.tres"),
	"sword_small": preload("res://resources/items/sword_small.tres"),
	"sword_big": preload("res://resources/items/sword_big.tres")
}

var items:Array[Item]


func _ready() -> void:
	add_item("apple")
	add_item("pear")
	add_item("peach")
	add_item("cherry")


func add_item (_item:String):
	var item:Item = item_preload.instantiate()
	
	item.item_data = items_data[_item]
	
	item.item_selected.connect(_on_item_selected)
	
	add_child(item)
	

func add_item_data (_item_data:ItemData):
	var item:Item = item_preload.instantiate()
	
	item.item_data = _item_data
	
	item.item_selected.connect(_on_item_selected)
	
	add_child(item)


func _on_item_selected (item_data):
	item_selected.emit(item_data)
