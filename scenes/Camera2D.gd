extends Camera2D


export var intensity = 2.5
var can_shake = false

# no randomize since we want the shake to feel equals



func _process(delta):
	if can_shake:
		offset = Vector2(-1 + 2*randf(), - 1 + 2*randf()) * intensity

	
func _on_game_shake():
	can_shake = true
	$Timer.start()
	

func _on_Timer_timeout():
	can_shake = false
	offset = Vector2.ZERO
	
