extends Control

var _nul = ""

var SCORE = []

func _ready():
	$NinePatchRect/VBoxContainer/lb_score.text = 'SCORE: ' + str(Global.SCORE)
	loadScore()

func _on_playBtn_pressed():
	Global.SCORE = 0
	var _sceneState
	_sceneState= get_tree().change_scene("res://Scenes/World.tscn")

func _on_quitBtn_pressed():
	get_tree().quit()

func _on_ShareBtn_pressed():
	var _err
	_err = OS.shell_open("https://wa.me/?text=Nice I scored '" + str(Global.SCORE) +"' on \n\r https://dragoon.co.za/Space")

func saveScore(Score,PlayerName):
	SCORE.append({"name":PlayerName,"score":Score})
	var content = JSON.print(SCORE)
	var file = File.new()
	file.open("user://SpaceShooter_Scores.dat", File.WRITE)
	file.store_string(content)
	file.close()

func _on_saveBtn_pressed():
	var PlayerName = $NinePatchRect/VBoxContainer/TextEdit.text
	saveScore(str(Global.SCORE),PlayerName)
	Global.SCORE = 0
	var _sceneState
	_sceneState= get_tree().change_scene("res://Scenes/World.tscn")

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
