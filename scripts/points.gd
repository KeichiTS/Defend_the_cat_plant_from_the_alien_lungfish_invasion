extends Node

var points = 0

var status setget set_status

var hiscores = [1000,900,800,700,600,500,400,300,200,100]

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
