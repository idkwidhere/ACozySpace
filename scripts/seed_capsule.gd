extends Resource
class_name Seed_Capsule

@export var type : String
@export var texture : Texture2D


func _init(itype, itexture):
	type = itype
	texture = itexture
