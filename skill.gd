class_name Skill

static var texture : Texture2D
var name: String
var description: String
var cost: int

func _init(texture_ : Texture2D):
	self.texture = texture_
	name = "Test skill"
	description = "Test description"
	cost = 100
