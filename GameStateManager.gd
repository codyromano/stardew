extends Node

var _state = {}
const _save_file_name = "user://savegame.save"

# Called when the node enters the scene tree for the first time.
func _ready():
	self._state = self._get_default_state();
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_goal(name):
	self._state['goals'].append(name)
	self.save()
	
func set_state(key, value):
	self._state[key] = value
	self.save()
	
func _get_default_state():
	return {
		"goals": [],
		"season": SeasonManager.get_season_label()
	}

func save():
	var save_file = FileAccess.open(self._save_file_name, FileAccess.WRITE)
	var json_string = JSON.stringify(self._state)
	save_file.store_line(json_string)
		
func load_game():
	if not FileAccess.file_exists(self._save_file_name):
		print("No save to load")
		return 

	var save_file = FileAccess.open(self._save_file_name, FileAccess.READ)
	var json_string = save_file.get_line()
	
	# Creates the helper class to interact with JSON.
	var json = JSON.new()
	
	# Check if there is any error while parsing the JSON string, skip in case of failure.
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
		
	var game_state = json.data
	print("save data: ")
	print(game_state)
	
	self._state = game_state
