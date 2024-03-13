class_name ItemData
extends Resource


#item stuff?

enum Type {SEED_CAPSULE, CROP, TOOL, MAIN}

@export var type: Type
@export var name: String
@export_multiline var item_description: String
@export var item_texture : Texture2D


