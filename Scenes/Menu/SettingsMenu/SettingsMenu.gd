extends Control

var can_change_key = false
var action_string
const keyPath = "NinePatchRect/VBoxContainer/KeyBindings/ScrollBar/VBoxContainer/HBoxCont_"
enum ACTIONS {JUMP, CROUCH, SHOOT, UP, DOWN, LEFT, RIGHT}

func _ready(): 
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
  

func _mark_button(string):
	can_change_key = true
	action_string = string
	
	for j in ACTIONS:
		if j != string:
			get_node(keyPath + str(j) + "/Button").set_pressed(false)

func _input(event):
	if event is InputEventKey || event is InputEventMouseButton:
		if can_change_key:
			_change_key(event)
			can_change_key = false

func _change_key(new_key):
	#Delete key of pressed button
	if !InputMap.get_action_list(action_string).empty():
		InputMap.action_erase_event(action_string, InputMap.get_action_list(action_string)[0])
	
	#Check if new key was assigned somewhere
	for i in ACTIONS:
		if InputMap.action_has_event(i, new_key):
			InputMap.action_erase_event(i, new_key)
			
	#Add new Key
	InputMap.action_add_event(action_string, new_key)
	

func _on_backBtn_pressed():
	var _sceneState
	_sceneState= get_tree().change_scene("res://Scenes/Menu/MainMenu.tscn")

func _on_CheckButton_toggled(_button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen

func _on_VolumeMusic_value_changed(value):
	var set_vol = (value / 2.5) - 40
	Global.set_Volume(set_vol)

func _on_VolumeGame_value_changed(value):
	var set_vol = (value / 2.5) - 26
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), set_vol)

