extends GridContainer


var inventory_size = 6
var items_to_load = [
	"res://resources/potato_seed_capsule.tres"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in inventory_size:
		var slot := InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(64, 64))
		add_child(slot)

	for i in items_to_load.size():
		var item := InventoryItem.new()
		item.init(load(items_to_load[i]))
		get_child(i).add_child(item)
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
