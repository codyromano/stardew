extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Set a Goal for " + SeasonManager.get_season_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save():
	return {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"season_text" : self.text
	}
	
func hydrate(state):
	print("hydrated text: %s" % state.season_text)
