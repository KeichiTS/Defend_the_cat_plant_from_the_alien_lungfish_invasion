extends StaticBody2D

var hp = 10

func _ready():
	pass



func _on_collision_area_entered(area):
	if area.is_in_group("enemy"):
		hp -= 1
		area.queue_free()
		if hp <= 0:
			queue_free()
