@tool
class_name InventoryContainer
extends GridContainer

var slot_list = []

@export var slots : int:
	set(new_slot_count):
		if !Engine.is_editor_hint() || !is_node_ready():
			# Slot count is only changable in the editor for now
			return
		slots = new_slot_count
		
		for slot in slot_list:
			# Normally we'd use queue_free, but in this case we have to work sequentially
			# Or else they won't be freed till after the setter
			slot.free()
			
		var slot_display_scene : PackedScene = load("res://slot_display.tscn")
		
		slot_list.clear()
		for _i in new_slot_count:
			var slot_display = slot_display_scene.instantiate()
			slot_display.name = "Slot %s" % _i
			slot_list.append(slot_display)
			
			add_child(slot_display)
			slot_display.owner = get_tree().edited_scene_root
		property_list_changed.emit()

func _ready() -> void:
	slot_list.clear()
	slots = 0
	for child in get_children():
		slot_list.append(child)
		slots += 1
