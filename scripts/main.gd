extends Node2D

var trans_bg2_status = 0
var trans_bg3_status = 0
var trans_bg4_status = 0


func _ready():
	if !Music.is_playing:
		Music.is_playing
		Music.play_bkg()
	$logo_transition.play("event")
	$transition.play("event")
	yield($transition,"animation_finished")
	
func _process(delta):
	if trans_bg2_status == 0:
		$background/bg2.modulate.a -= delta
		if $background/bg2.modulate.a <= 0.00:
			trans_bg2_status = 1
	else:
		$background/bg2.modulate.a += delta
		if $background/bg2.modulate.a >= 1:
			trans_bg2_status = 0
	##########
	if trans_bg3_status == 0:
		$background/bg3.modulate.a -= 0.5*delta
		if $background/bg3.modulate.a <= 0.1:
			trans_bg3_status = 1
	else:
		$background/bg3.modulate.a += 0.5*delta
		if $background/bg3.modulate.a >= 1:
			trans_bg3_status = 0
	##########
	if trans_bg4_status == 0:
		$background/bg4.modulate.a -= 0.2*delta
		if $background/bg4.modulate.a <= 0.2:
			trans_bg4_status = 1
	else:
		$background/bg4.modulate.a += 0.2*delta
		if $background/bg4.modulate.a >= 1:
			trans_bg4_status = 0

	if Input.is_action_just_pressed("shoot"):
		$transition.play("event2")
		yield($transition,"animation_finished")
		get_tree().change_scene("res://scenes/game.tscn")
		
