extends Label

const target_duration = 1.5 # seconds

var animation_start_time = null
var true_value = null
var display_value = null

# Called when the node enters the scene tree for the first time.
func _ready():
	true_value = self.text.to_float()
	animation_start_time = Time.get_unix_time_from_system()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var elapsed_time = min(
		Time.get_unix_time_from_system() - animation_start_time,
		target_duration
	)
	var current_value = round(
		(elapsed_time / target_duration) * true_value
	)
	self.text = str(current_value)
	
