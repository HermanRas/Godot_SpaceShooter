extends Control
	
func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)

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
