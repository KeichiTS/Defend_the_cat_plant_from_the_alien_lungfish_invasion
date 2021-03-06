extends Area2D

var target = Vector2(400,300)
export var speed = 100
export(int,"HP","Double_Shield") var status
var dir = Vector2(0,-1) setget set_dir
var light_count = 0 
export var hp = 1


func _ready():
	if status == 0:
		$pu1.show()
		$pu2.hide()
	else:
		$pu1.hide()
		$pu2.show()
		
	
func _process(delta):
	var pos = (target - position).normalized()
	translate(pos*speed*delta)
	rotate(delta)
	if light_count == 0:
		$light.energy += 3 * delta
		if $light.energy >= 2:
			light_count = 1
	elif light_count <= 1:
		$light.energy -= 3 * delta
		if $light.energy <= .5:
			light_count = 0
	#look_at(target)

func set_dir(val):
	dir = val 
	rotation = dir.angle()


func _on_upgrade_area_entered(area):
	if area.is_in_group("bullet"):
		area.queue_free()
		queue_free()
