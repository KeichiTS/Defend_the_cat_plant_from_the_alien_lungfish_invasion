extends Node2D

const letters = "ABCDEFGHIJKLMNOPQRSTUVXWYZ0123456789_*#$ "

var index = 0
var letter = 0 

signal finished(nome)


func _ready():
	set_process_input(true)

func _input(event):
	var change = false
	if event.is_action_pressed("shoot") and not event.is_echo():
		index += 1
		change = true
		
		if index == 41:
			index = 0
	if change:
		$container.get_child(letter).text = letters[index]

	if event.is_action_pressed("skip") and not event.is_echo():
		index = 0
		$container.get_child(letter).modulate.a = 1
		letter += 1
		if letter > 2: 
			$timer.stop()
			set_process_input(false)
			var nome = $container/l1.text + $container/l2.text + $container/l3.text 
			emit_signal("finished", nome)
func _on_timer_timeout():
	if $container.get_child(letter).modulate.a > 0:
		$container.get_child(letter).modulate.a = 0
	else:
		$container.get_child(letter).modulate.a = 1
		
		


func _on_blink_text_timeout():
	if $text.modulate.a > 0:
		$text.modulate.a = 0
	else:
		$text.modulate.a = 1
