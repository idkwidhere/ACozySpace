class_name InventoryItem
extends TextureRect

@export var data: ItemData

func init(d: ItemData) -> void:
	data = d
	

func _ready():
	expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture = data.item_texture
