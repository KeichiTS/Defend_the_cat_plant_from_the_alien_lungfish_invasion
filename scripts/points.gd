extends Node

var points = 0 setget set_points

var hiscores = [1000,900,800,700,600,500,400,300,200,100]

signal upgrade 

func set_points(value):
	points = value
	if value == 10:
		emit_signal("upgrade")

func _ready():
	pass
