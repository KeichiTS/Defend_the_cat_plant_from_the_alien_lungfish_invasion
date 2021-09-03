extends Node2D

var enemy = preload("res://scenes/enemy.tscn")
var enemy2 = preload("res://scenes/enemy2.tscn")
var enemy3 = preload("res://scenes/enemy3.tscn")


func _ready():
	randomize()


func _on_spawn_timer_timeout():
	var en = enemy.instance()
	en.global_position = spawn_spot()
	get_parent().add_child(en)
	$spawn_timer.wait_time = rand_range(1,3)

func _on_spawn_timer_2_timeout():
	var en = enemy2.instance()
	en.global_position = spawn_spot()
	get_parent().add_child(en)
	$spawn_timer_2.wait_time = rand_range(4,8)

func _on_spawn_timer_3_timeout():
	var en = enemy3.instance()
	en.global_position = spawn_spot()
	get_parent().add_child(en)
	$spawn_timer_3.wait_time = rand_range(10,20)

func spawn_spot():
	var spawner_area = randi()%4
	var enemy_position
	if spawner_area == 0:
		enemy_position = Vector2(rand_range(-50,0), rand_range(-50,650))
	elif spawner_area == 1:
		enemy_position = Vector2(rand_range(800,850), rand_range(-50,650))
	elif spawner_area == 2:
		enemy_position = Vector2(rand_range(0,800), rand_range(-50,0))
	elif spawner_area == 3:
		enemy_position = Vector2(rand_range(0,800), rand_range(600,650))
	return(enemy_position)


