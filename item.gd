class_name Item

static var texture : Texture2D
var name: String
var description: String
var cost: int
var charges: int

func _init(texture_ : Texture2D):
	self.texture = texture_
	name = "Test item"
	description = "Test description"
	cost = 100
	charges = 3
