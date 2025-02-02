extends Node2D

var reward_scene = preload("res://scenes/RewardContainer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# Debugging
	"""
	const debugging_goal = "Archery"
	GameStateManager.add_goal(debugging_goal)
	GameStateManager.add_progress(
		debugging_goal,
		650
	);
	
	const debugging_goal2 = "Gym"
	GameStateManager.add_goal(debugging_goal2)
	GameStateManager.add_progress(
		debugging_goal2,
		650
	);
	"""
		
	var vbox = get_node("VBoxContainer")
	var goals = GameStateManager.get_goals()
	for goal in goals:
		var update = GameStateManager.get_latest_progress_update(goal)
		
		if update:
			var scene = reward_scene.instantiate()
			scene.set_goal_label(goal)
			vbox.add_child(scene)
		else:
			print("No progress made for goal " + goal)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
