extends StaticBody2D

var hp = 3

func _ready():
	pass



func _on_collision_area_entered(area):
	if area.is_in_group("enemy"):
		hp -= 1
		area.queue_free()
		if hp <= 0:
			get_tree().reload_current_scene()
