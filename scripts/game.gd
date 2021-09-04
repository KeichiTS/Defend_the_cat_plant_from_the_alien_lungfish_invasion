extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
var enemy2 = preload("res://scenes/enemy2.tscn")
var enemy3 = preload("res://scenes/enemy3.tscn")
var powerup = preload("res://scenes/upgrade.tscn")


func _ready():
	randomize()
	$cat_planet.connect("hited",self,"on_hited") 
	$cat_planet.connect("death",self, "on_death")
	

func _process(delta):
	$points.text = "POINTS:\n" + str(POINTS.points)

func _on_spawn_timer_timeout():
	var en = enemy.instance()
	var rect = randi()%2
	if rect == 0:
		en.scale.y *= -1
	en.global_position = spawn_spot()
	en.speed = rand_range(80,120)
	$spawn_area.get_parent().add_child(en)
	$spawn_timer.wait_time = rand_range(1,3)

func _on_spawn_timer_2_timeout():
	var en = enemy2.instance()
	var rect = randi()%2
	if rect == 0:
		en.scale.y *= -1
	en.global_position = spawn_spot()
	$spawn_area.get_parent().add_child(en)
	en.speed = rand_range(180,220)
	$spawn_timer_2.wait_time = rand_range(4,8)

func _on_spawn_timer_3_timeout():
	var en = enemy3.instance()
	var rect = randi()%2
	if rect == 0:
		en.scale.y *= -1
	en.global_position = spawn_spot()
	en.speed = rand_range(30,70)
	$spawn_area.get_parent().add_child(en)
	$spawn_timer_3.wait_time = rand_range(10,20)
	
func _on_pu_timer_timeout():
	var pu = powerup.instance()
	var rect = randi()%2
	if rect == 0:
		pu.scale.y *= -1
	pu.global_position = spawn_spot()
	pu.status = randi()%2
	print(pu.status)
	$spawn_area.get_parent().add_child(pu)
	$pu_timer.wait_time = rand_range(20,40)

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
	for i in range(10):
		if POINTS.points > POINTS.hiscores[i]:
			POINTS.hiscores[i] = POINTS.points
			break
			
	POINTS.points = 0 
	get_tree().reload_current_scene()


