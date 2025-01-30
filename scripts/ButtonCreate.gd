extends Button

@onready var line_edit = get_node("/root/ResolutionCreationNode2D/Control/VBoxContainer/LineEdit")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	GameStateManager.add_goal(line_edit.text)
	get_tree().change_scene_to_file("res://scenes/ProgressReport.tscn")
