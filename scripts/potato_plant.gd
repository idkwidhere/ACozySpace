extends Sprite2D

const POTATO_SPROUT = preload("res://assets/potato/potato_sprout.png")
const POTATO_GROWTH = preload("res://assets/potato/potato_growth.png")
const POTATO_DEVELOPING = preload("res://assets/potato/potato_developing.png")
const POTATO_MATURE = preload("res://assets/potato/potato_mature.png")

var plant_state = {
0: 250, 
1: 500, 
2: 500,
}

var state = 0
var started = false
var can_harvest = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !started and state <= len(plant_state) - 1:
		started = true
		grow_plant(plant_state[state])
	
	
	
func grow_plant(time):
	await get_tree().create_timer(time).timeout
	started = false
	state += 1
	match state:
		1:
			texture = POTATO_GROWTH
		2:
			texture = POTATO_DEVELOPING
		3:
			texture = POTATO_MATURE
			can_harvest = true
			print("can harvest")
	


