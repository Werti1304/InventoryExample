@tool
class_name SkillContainer
extends "res://inventory_container.gd"

var skill_dict = {}

func add(skill : Skill) -> bool:
	for slot_var in slot_list:
		# No typed arrays in GDscript :/
		var slot := slot_var as SlotDisplay
		
		if(!slot.canAddSprite()):
			continue
		slot.addSprite(skill.texture)
		skill_dict.get_or_add(slot, skill)
		return true
	return false
	
