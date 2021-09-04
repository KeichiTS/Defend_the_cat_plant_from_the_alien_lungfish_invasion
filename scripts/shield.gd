extends Area2D

var bullet = preload("res://scenes/bullet.tscn")

enum {ready, cd}
var status = ready
var upgrades = 0
var double_shot = false

func _ready():
	$polyb.disabled = true
	#upgrade_strong_shield()
	POINTS.connect("upgrade",self,"upgrade_shield")

func upgrade_shield(val):
	if val == 0:
		upgrade_double_shield()
		$upgrade_timer.start()
	
func upgrade_double_shield():
	$polyb.disabled = false
	$cannon_spriteb.show()
	$muzzleb.show()
	$shield_sprite.frame = 1
	double_shot = true

	
func disable_double_shield():
	$polyb.disabled = true
	$cannon_spriteb.hide()
	$muzzleb.hide()
	$shield_sprite.frame = 0
	double_shot = false


func _process(delta):
	
	if status == ready:
		if Input.is_action_just_pressed("shoot"):
			var bull = bullet.instance()
			bull.global_position = $muzzle.global_position
			bull.dir = Vector2(cos(rotation), sin(rotation)).normalized()
			get_parent().add_child(bull)
			if double_shot:
				var bullb = bullet.instance()
				bullb.global_position = $muzzleb.global_position
				bullb.dir = Vector2(-cos(rotation), -sin(rotation)).normalized()
				get_parent().add_child(bullb)
			status = cd
			$shoot_timer.start()
	look_at(get_global_mouse_position())


func _on_shoot_timer_timeout():
	status = ready


func _on_upgrade_timer_timeout():
	disable_double_shield()
