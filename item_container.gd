@tool
class_name ItemContainer
extends "res://inventory_container.gd"

var item_dict = {}

func add(item : Item) -> bool:
	for slot_var in slot_list:
		# No typed arrays in GDscript :/
		var slot := slot_var as SlotDisplay
		
		if(!slot.canAddSprite()):
			continue
		slot.addSprite(item.texture)
		slot.clicked.connect(itemUsed.bind(slot))
		item_dict.get_or_add(slot, item)
		return true
	return false
	
func itemUsed(slot: SlotDisplay):
	var item := item_dict.get(slot) as Item
	item.charges -= 1
	print("Charges left on item %s: %s" % [item.name, item.charges])
	
	if item.charges <= 0:
		slot.removeSprite()
		slot.clicked.disconnect(itemUsed.bind(slot))
		item_dict.erase(slot)
	# Garbage Collector comes in for item, we don't need to free
