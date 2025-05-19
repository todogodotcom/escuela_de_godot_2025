class_name ItemData
extends Resource

enum TYPE {
	CONSUMABLE,
	RESOURCE,
	MATERIAL,
	RECIPE,
	WEAPON,
	ARMOR,
	CURRENCY,
	ENCHANTMENT,
	GEM
}

## NOTE: Dentro de un recurso sólo se puede exportar recursos y tipos básicos (int, float, etc.) 
@export var texture:Texture
@export var name:String = ""
@export var type:TYPE = TYPE.CONSUMABLE

@export_category("Stats")
@export var health:int = 0
@export var damage:int = 0
@export var armor:int = 0
@export var accuracy:int = 0
@export var critical_rate:int = 0
@export var tradeable:bool = true
