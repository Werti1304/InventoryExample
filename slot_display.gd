class_name SlotDisplay
extends ColorRect

signal clicked

@export_category("Meta")
@export var sprite: Sprite2D = null

func _ready() -> void:
	sprite.visible = false
	self.gui_input.connect(_on_gui_input)

func addSprite(texture : Texture2D):
	sprite.texture = texture
	sprite.visible = true
	
func canAddSprite() -> bool:
	return !sprite.visible
	
func removeSprite():
	sprite.visible = false
	sprite.texture = null

func _on_gui_input(event: InputEvent) -> void:
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and sprite.visible:
		print("Inventory Slot Clicked")
		clicked.emit()
