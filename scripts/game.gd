extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
var enemy2 = preload("res://scenes/enemy2.tscn")
var enemy3 = preload("res://scenes/enemy3.tscn")
var powerup = preload("res://scenes/upgrade.tscn")

var pre_name_selector = preload("res://scenes/name_selector.tscn")
var pre_hiscore_table = preload("res://scenes/hi-score.tscn")

#var trans_bg2 = $background/bg2.modulate.a
#var trans_bg3 = $background/bg3.modulate.a
#var trans_bg4 = $background/bg4.modulate.a

var trans_bg2_status = 0
var trans_bg3_status = 0
var trans_bg4_status = 0

var hiscore = 0

func _ready():
	if !Music.is_playing:
		Music.is_playing
		Music.play_bkg()
	$transition.play("event")
	yield($transition,"animation_finished")
	randomize()
	$cat_planet.connect("hited",self,"on_hited") 
	$cat_planet.connect("death",self, "on_death")
	

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func _process(delta):
	$points.text = "POINTS:\n" + str(POINTS.points)
	#######
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
			
func _on_spawn_timer_timeout():
	var en = enemy.instance()
	var rect = randi()%2
	if rect == 0:
		en.scale.y *= -1
	en.global_position = spawn_spot()
	en.speed = rand_range(80,120)
	#$spawn_area.get_parent().add_child(en)
	$spawn_area.add_child(en)
	
	$spawn_timer.wait_time = rand_range(1,3)

func _on_spawn_timer_2_timeout():
	var en = enemy2.instance()
	var rect = randi()%2
	if rect == 0:
		en.scale.y *= -1
	en.global_position = spawn_spot()
	#$spawn_area.get_parent().add_child(en)
	$spawn_area.add_child(en)
	en.speed = rand_range(180,220)
	$spawn_timer_2.wait_time = rand_range(4,8)

func _on_spawn_timer_3_timeout():
	var en = enemy3.instance()
	var rect = randi()%2
	if rect == 0:
		en.scale.y *= -1
	en.global_position = spawn_spot()
	en.speed = rand_range(30,70)
	#$spawn_area.get_parent().add_child(en)
	$spawn_area.add_child(en)
	$spawn_timer_3.wait_time = rand_range(10,20)
	
func _on_pu_timer_timeout():
	var pu = powerup.instance()
	var rect = randi()%2
	if rect == 0:
		pu.scale.y *= -1
	pu.global_position = spawn_spot()
	pu.status = randi()%2
	$spawn_area.add_child(pu)
	#$pu_timer.wait_time = rand_range(2,5)
	$pu_timer.wait_time = rand_range(20,50)

func spawn_spot():
	var spawner_area = randi()%4
	var enemy_position
	if spawner_area == 0:
		enemy_position = Vector2(rand_range(-150,-100), rand_range(-100,700))
	elif spawner_area == 1:
		enemy_position = Vector2(rand_range(900,950), rand_range(-100,700))
	elif spawner_area == 2:
		enemy_position = Vector2(rand_range(0,800), rand_range(-150,-100))
	elif spawner_area == 3:
		enemy_position = Vector2(rand_range(0,800), rand_range(700,750))
	return(enemy_position)

func on_hited(hp):
	$life.text = "LIFE:\n" + str(hp)


func on_death():
	var index = 0
	var name_selector = pre_name_selector.instance()
	var hiscore_table = pre_hiscore_table.instance()
	
	for hs in POINTS.hiscores:
		if POINTS.points > hs.score:
			hs.score = POINTS.points
			index = 1
			break
		hiscore += 1
	
	$spawn_timer.queue_free()
	$spawn_timer_2.queue_free()
	$spawn_timer_3.queue_free()
	$pu_timer.queue_free()
	$spawn_area.queue_free()
	$shield.queue_free()
	
	if index == 1:
		add_child(name_selector)
		name_selector.connect("finished", self, "on_name_selector_finished")
		yield(name_selector,"finished")
	
	name_selector.queue_free()
	$life.modulate.a = 0
	$points.modulate.a = 0
	$play.visible = true
	$play.disabled = false
	
	add_child(hiscore_table)
	
	POINTS.points = 0 
	
	
	#get_tree().reload_current_scene()


func _on_Volume_control_pressed():
	$Menu/Menu.popup_centered()
	get_tree().paused = true


func _on_Volume_sfx_value_changed(value):
	pass # Replace with function body.

func on_name_selector_finished(val):
	#var index = POINTS.hiscores.find(hiscore)
	POINTS.hiscores[hiscore].nome = val
	print(POINTS.hiscores)


func _on_play_pressed():
	get_tree().reload_current_scene()
