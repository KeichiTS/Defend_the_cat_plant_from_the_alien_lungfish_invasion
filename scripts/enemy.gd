extends Area2D

var target = Vector2(400,300)
export var speed = 100
var dir = Vector2(0,-1) setget set_dir
export var hp = 2
export var pt = 10
enum {alive,dead}
var status = alive

func _ready():
	pass
	
func _process(delta):
	if status == alive:
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
			if status == alive:
				POINTS.points += pt
			status = dead
			$CollisionShape2D.disabled = true
			$anim.play("anim")
			yield($anim,"animation_finished")
			queue_free()

