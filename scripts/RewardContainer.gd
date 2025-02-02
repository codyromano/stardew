extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_goal_label(goal_name):
	self.get_node("Control/HBoxContainer/GoalNameLabel").text = goal_name

func set_reward_amount(amount):
	self.get_node("Control/HBoxContainer/RewardAmountLabel").text = str(amount)
