extends StaticBody2D

var hp = 3
signal hited(hp)
signal death()

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
