extends StaticBody2D

var hp = 3
enum {double_shied,strong_shield}

signal hited(hp)
signal death()
signal upgrade(val)
func _ready():
	pass
	


func _on_collision_area_entered(area):
	if area.is_in_group("enemy"):
		hp -= 1
		emit_signal("hited", hp)
		area.queue_free()
		if hp <= 0:
			emit_signal("death")
			queue_free()
	
	elif area.is_in_group("upgrade"):
		if area.status == 0:
			hp += 1
			emit_signal("hited", hp)
			
		elif area.status == 1:
			POINTS.status = 0
			
		area.queue_free()
