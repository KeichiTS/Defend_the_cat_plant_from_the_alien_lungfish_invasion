extends Node

var points = 0



var status setget set_status

var hiscores = [
	{nome = "KEI", score = 2230},
	{nome = "JPP", score = 1850},
	{nome = "RIK", score = 1120},
	{nome = "DDD", score = 700},
	{nome = "EEE", score = 600},
	{nome = "FFF", score = 500},
	{nome = "GGG", score = 400},
	{nome = "HHH", score = 300},
	{nome = "III", score = 200},
	{nome = "JJJ", score = 100}
	]

signal upgrade(val)

#func set_points(value):
#	points = value
#	if value == 10:
#		emit_signal("upgrade")

func set_status(val):
	#status = val
	#if val == 0:
	emit_signal("upgrade", val)
	#elif val == 1:
	#	emit_signal("ugrade", 1)

func _ready():
	pass
