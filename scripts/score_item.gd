extends HBoxContainer

var pos = "1ST" setget set_pos
var nome = "AAA" setget set_nome
var score = "AAA" setget set_score
 
func _ready():
	pass


func set_pos(val):
	pos = val
	$pos.text = str(val)
	
func set_nome(val):
	nome = val
	$nome.text = str(val)
	
func set_score(val):
	score = val
	$score.text = str(val)
