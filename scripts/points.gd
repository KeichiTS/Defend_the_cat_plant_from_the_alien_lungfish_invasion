extends Node

var points = 0



var status setget set_status

var hiscores = [
	{nome = "AAA", score = 1000},
	{nome = "BBB", score = 900},
	{nome = "CCC", score = 800},
	{nome = "DDD", score = 700},
	{nome = "EEE", score = 600},
	{nome = "FFF", score = 500},
	{nome = "GGG", score = 400},
	{nome = "HHH", score = 300},
	{nome = "III", score = 20},
	{nome = "JJJ", score = 2}
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
