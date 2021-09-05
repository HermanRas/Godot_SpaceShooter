extends Control

var SCORE = []

func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	loadScore()
	print(SCORE)
	if SCORE.size() > 0:
		$NinePatchRect/VBoxContainer/score_Name.text = SCORE[0].name + " " + SCORE[0].score

func _on_playBtn_pressed():
	var _sceneState
	_sceneState= get_tree().change_scene("res://Scenes/World.tscn")

func _on_settingsBtn_pressed():
	var _sceneState
	_sceneState= get_tree().change_scene("res://Scenes/Menu/SettingsMenu/SettingsMenu.tscn")

func _on_quitBtn_pressed():
	get_tree().quit()

func _on_ShareBtn_pressed():
	var _err
	_err = OS.shell_open('https://dragoon.co.za/Space')

func loadScore():
	var file2Check = File.new()
	var doFileExists = file2Check.file_exists("user://SpaceShooter_Scores.dat")
	
	if doFileExists :
		var file = File.new()
		file.open("user://SpaceShooter_Scores.dat", File.READ)
		var content = JSON.parse(file.get_as_text())
		file.close()
		SCORE = content.result
		SCORE.sort_custom(MyCustomSorter, "sort")

class MyCustomSorter:
	static func sort(a, b):
		if a["score"] > b["score"]:
			return true
		return false
