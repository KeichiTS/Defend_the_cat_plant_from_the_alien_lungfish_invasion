extends Area2D

var target = Vector2(400,300)
export var speed = 100
var dir = Vector2(0,-1) setget set_dir
export var hp = 2
export var pt = 10
enum {death,alive}
var status = alive



signal shake


func _ready():
	pass
	
func _process(delta):
	var pos = (target - position).normalized()
	if status == alive:
		translate(pos*speed*delta)
	look_at(target)

func set_dir(val):
	dir = val 
	rotation = dir.angle()




func _on_enemy_area_entered(area):
	if area.is_in_group("bullet"):
		
		area.queue_free()
		
		hp -= 1
		if hp == 0:

			status = death
			
			emit_signal("shake")
			$CollisionShape2D.disabled = true
			
			POINTS.points += pt
			Music.play_explosion()
			$anim.play("anim")
			yield($anim,"animation_finished")
			queue_free()
			


