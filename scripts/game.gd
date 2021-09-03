extends Node2D

var enemy = preload("res://scenes/enemy.tscn")

func _ready():
	pass


func _on_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-160, 960), rand_range(-160,760))
	var en = enemy.instance()
	
	while enemy_position.x < 800 and enemy_position.x > -100 or enemy_position.y < 600 and enemy_position.y > -100:
		enemy_position = Vector2(rand_range(-160, 960), rand_range(-160,760))
	
	en.global_position = enemy_position
	get_parent().add_child(en)
