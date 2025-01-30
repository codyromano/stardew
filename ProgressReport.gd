extends Node2D

var progress_scene = preload("res://category_progress_row.tscn")  # Load the component
@onready var category_container

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO: Implement public method to get goals
	var categories = GameStateManager._state["goals"]
	var vbox = self.get_node("Control/VBoxContainer/CategoryProgressRowsContainer")
			
	for category in categories:
		var progress_instance = progress_scene.instantiate()
		progress_instance.set_category_label(category)
		vbox.add_child(progress_instance, false)  # Add to UI
		vbox.move_child(progress_instance, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_add_goal_button_pressed():
	get_tree().change_scene_to_file("res://ResolutionCreation.tscn")
