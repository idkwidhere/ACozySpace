extends StaticBody2D

var seeds_planted = []
@onready var seeds = $Seeds

#plants
const POTATO_PLANT = preload("res://scenes/plants/potato_plant.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	print(len(seeds.get_children()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		

func add_seed(type, marker):
	print("seed planted")
