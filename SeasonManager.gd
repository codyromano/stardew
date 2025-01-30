extends Node

# Enum for the seasons
enum Season { SPRING, SUMMER, FALL, WINTER }

# Current season (default to SPRING or detect based on real time)
var current_season: Season = Season.SPRING

# Set the current season and emit a signal
func set_current_season(value: Season):
	current_season = value
	emit_signal("season_changed", current_season)

# Initialize the season based on real-life time
func _ready():
	current_season = get_season_enum()

# Determine the season based on the real-life date
func get_season_enum() -> Season:
	var month = Time.get_datetime_dict_from_system().month
	if month in [3, 4, 5]: return Season.SPRING
	elif month in [6, 7, 8]: return Season.SUMMER
	elif month in [9, 10, 11]: return Season.FALL
	else: return Season.WINTER

func get_season_label():
	match current_season:
		SeasonManager.Season.SPRING:
			return "Spring"
		SeasonManager.Season.SUMMER:
			return "Summer"
		SeasonManager.Season.FALL:
			return "Fall"
		SeasonManager.Season.WINTER:
			return "Winter"
