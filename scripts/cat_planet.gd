extends StaticBody2D

var hp = 3
enum {double_shied,strong_shield}

signal hited(hp)
signal death()
signal upgrade(val)
func _ready():
	pass
	
func _process(delta):
	$sprites.rotate(0.1*delta)
	$light.rotate(0.05*delta)
	change_sprite()
	



func _on_collision_area_entered(area):
	if area.is_in_group("enemy"):
		$hit_animation.play("event")
		hp -= 1
		emit_signal("hited", hp)
		area.queue_free()
		Music.play_explosion()
		if hp <= 0:
			emit_signal("death")
			queue_free()
	
	elif area.is_in_group("upgrade"):
		$hit_animation.play("event2")
		if area.status == 0:
			if hp < 5:
				hp += 1
				emit_signal("hited", hp)
				Music.play_powerup()
			
		elif area.status == 1:
			POINTS.status = 0
			
		area.queue_free()
	
	yield($hit_animation,"animation_finished")
	
func change_sprite():
	if hp == 5:
		$sprites/sprite.show()
		$sprites/sprite2.hide()
		$sprites/sprite3.hide()
		$sprites/sprite4.hide()
		$sprites/sprite5.hide()
	
	elif hp == 4:
		$sprites/sprite.hide()
		$sprites/sprite2.show()
		$sprites/sprite3.hide()
		$sprites/sprite4.hide()
		$sprites/sprite5.hide()
		
	elif hp == 3:
		$sprites/sprite.hide()
		$sprites/sprite2.hide()
		$sprites/sprite3.show()
		$sprites/sprite4.hide()
		$sprites/sprite5.hide()
		
	elif hp == 2:
		$sprites/sprite.hide()
		$sprites/sprite2.hide()
		$sprites/sprite3.hide()
		$sprites/sprite4.show()
		$sprites/sprite5.hide()
		
	elif hp == 1:
		$sprites/sprite.hide()
		$sprites/sprite2.hide()
		$sprites/sprite3.hide()
		$sprites/sprite4.hide()
		$sprites/sprite5.show()
