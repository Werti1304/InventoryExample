class_name Inventory
extends Control

@export var itemContainer : ItemContainer
@export var skillContainer : SkillContainer
	
func _on_button_add_item_pressed() -> void:
	# Create new item here
	var texture = load("res://Item.png")
	var _testItem = Item.new(texture)
	var res = itemContainer.add(_testItem)
	
	if res == false:
		print("Inventory full!")
	else: 
		print("Item added to inventory")

func _on_button_add_skill_pressed() -> void:
	# Create new skill here
	var texture = load("res://Skill.png")
	var _testSkill = Skill.new(texture)
	var res = skillContainer.add(_testSkill)
	
	if res == false:
		print("Inventory full!")
	else: 
		print("Skill added to inventory")
