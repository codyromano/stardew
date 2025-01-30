extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pressed():
	var goal_nodes = get_tree().get_nodes_in_group("ProgressReportGoals")

	for node in goal_nodes:
		var label = node.get_node("Control/Label")
		var slider = node.get_node("Control/HSlider")
		
		
		# TODO: Why is this being instantiated with the default text?
		if label.text == "Example category":
			continue
			
		GameStateManager.add_progress(
			label.text,
			slider.value
		);
		
		# print(GameStateManager.get_latest_progress_update(label.text))
	get_tree().change_scene_to_file("res://scenes/EndOfDayRewards.tscn")
