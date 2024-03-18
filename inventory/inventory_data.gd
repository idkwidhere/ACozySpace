extends Resource
class_name InventoryData

@export var slot_datas: Array[SlotData]
signal inventory_interact(inventory_data:InventoryData, index: int, button: int)

func on_slot_clicked(index: int, button: int):
	inventory_interact.emit(self, index, button)
