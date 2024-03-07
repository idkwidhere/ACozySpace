extends CharacterBody2D
class_name Player

const SPEED = 300.0
var accel = 50
@onready var player_sprite = $PlayerSprite

# player signals
signal player_interact


# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):


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
	print(velocity)

	move_and_slide()

	# Player interact signal
	if Input.is_action_just_pressed("e"):
		player_interact.emit()

