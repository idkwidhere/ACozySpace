extends Sprite2D

const POTATO_SPROUT = preload("res://assets/potato/potato_sprout.png")
const POTATO_GROWTH = preload("res://assets/potato/potato_growth.png")
const POTATO_DEVELOPING = preload("res://assets/potato/potato_developing.png")
const POTATO_MATURE = preload("res://assets/potato/potato_mature.png")

var plant_state = {
0: 10, 
1: 10, 
2: 20, 
3:0
}

var state = 0
var started = false
var stage = 0
var can_harvest = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !started and stage <= 3:
		started = true
		grow_plant(plant_state[stage])
	
	
	
func grow_plant(time):
	print(stage)
	await get_tree().create_timer(time).timeout
	started = false
	stage += 1
	match stage:
		1:
			texture = POTATO_GROWTH
		2:
			texture = POTATO_DEVELOPING
		3:
			texture = POTATO_MATURE
			can_harvest = true
			print("can harvest")
	


