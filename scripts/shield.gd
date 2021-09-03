extends Area2D

var bullet = preload("res://scenes/bullet.tscn")

enum {ready, cd}
var status = ready

func _ready():
	pass

func _process(delta):
	
	if status == ready:
		if Input.is_action_just_pressed("shoot"):
			var bull = bullet.instance()
			bull.global_position = $muzzle.global_position
			bull.dir = Vector2(cos(rotation), sin(rotation)).normalized()
			get_parent().add_child(bull)
			status = cd
			$shoot_timer.start()
	
	look_at(get_global_mouse_position())


func _on_shoot_timer_timeout():
	status = ready
