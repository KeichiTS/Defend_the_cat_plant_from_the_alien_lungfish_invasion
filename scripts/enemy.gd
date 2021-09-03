extends Area2D

var target = Vector2(400,300)
var speed = 100
var dir = Vector2(0,-1) setget set_dir
var hp = 2

func _ready():
	pass

func _process(delta):
	var pos = (target - position).normalized()
	translate(pos*speed*delta)
	look_at(target)

func set_dir(val):
	dir = val 
	rotation = dir.angle()


func _on_enemy_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
		hp -= 1
		if hp <= 0:
			queue_free()
