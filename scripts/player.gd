extends CharacterBody2D
class_name Player

const SPEED = 300.0
var accel = 50
@onready var player_sprite = $PlayerSprite


#ui stuff??
var menu_open = false
var interact_type = null

# inventory stuff hopefully
var gold

var player_invetory = [
	{name: "gold", "quantity": 0},
]

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	for item in player_invetory:
		print(item)


func _process(_delta):
	if Input.is_action_just_pressed("tab") and menu_open == false:
		Signals.emit_signal("toggle_player_menu")
	if Input.is_action_just_pressed("e"):
		Signals.emit_signal("player_interact", interact_type)



func _physics_process(_delta):


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#MOVEMENT
	var direction = Input.get_vector("a", "d", "w", "s")
	
	velocity.x = move_toward(velocity.x, SPEED * direction.x, accel)
	velocity.y = move_toward(velocity.y, SPEED * direction.y, accel)
	
	if velocity.y > 0:
		global_rotation_degrees = 180
	if velocity.y < 0:
		global_rotation_degrees = 0
	if velocity.x > 0:
		global_rotation_degrees = 90
	if velocity.x < 0:
		global_rotation_degrees = -90
	#print(velocity)

	move_and_slide()

func _on_player_interact_area_body_entered(body):
	if body.has_method("_is_terminal"):
		interact_type = "terminal"
	if body.has_method("_is_shipping_box"):
		interact_type = "shipping_box"


func _on_player_interact_area_body_exited(body):
	if body.has_method("_is_terminal"):
		interact_type = null
	if body.has_method("_is_shipping_box"):
		interact_type = null
	
	Signals.emit_signal("player_interact", interact_type)
	
