extends Control

var _nul = ""

func _ready():
	$NinePatchRect/VBoxContainer/lb_score.text = 'SCORE: ' + str(Global.SCORE)

func _on_playBtn_pressed():
	Global.SCORE = 0
	var _sceneState
	_sceneState= get_tree().change_scene("res://Scenes/World.tscn")

func _on_quitBtn_pressed():
	get_tree().quit()

func _on_ShareBtn_pressed():
	var _err
	_err = OS.shell_open("https://wa.me/?text=Nice I scored '" + str(Global.SCORE) +"' on \n\r https://dragoon.co.za/Space")
