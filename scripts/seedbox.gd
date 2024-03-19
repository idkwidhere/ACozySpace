extends StaticBody2D

signal toggle_inventory(external_inventory_owner)
@export var inventory_data: InventoryData

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func player_interact() -> void:
	toggle_inventory.emit(self)

func _on_interact_area_body_entered(body):
	if body is Player:
		$Interact.visible = true

func _on_interact_area_body_exited(body):
	if body is Player:
		$Interact.visible = false
