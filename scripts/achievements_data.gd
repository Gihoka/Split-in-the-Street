extends Node

var achievements = [false, false, false, false, false]

func _ready():
	load_achievements()
	
func save():
	var save_dict = {
		"achievements" : achievements
	}
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	save_game.store_line(JSON.stringify(save_dict))

func load_achievements():
	if not FileAccess.file_exists("user://savegame.save"):
		save()
		return
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_string = save_game.get_line()
	var json = JSON.new()
	json.parse(json_string)
	var node_data = json.get_data()
	achievements = node_data["achievements"]
	
func unlock_achievement(achievement):
	achievements[int(achievement)-1] = true
	save()
