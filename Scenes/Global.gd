extends Node

var SCORE = 0

func set_Volume(db):
	$GameMusic.set_volume_db(db)

func set_GameMusicSpeed(PlaySpeed) :
	$GameMusic.pitch_scale = PlaySpeed
