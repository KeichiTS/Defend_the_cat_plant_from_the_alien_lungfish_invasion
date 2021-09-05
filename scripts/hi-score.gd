extends VBoxContainer

const pre_item = preload("res://scenes/score_item.tscn")

const position = ["1ST", "2ND", "3RD", "4TH", "5TH", "6TH", "7TH", "8TH", "9TH", "10TH"]

func _ready():
	show_hiscores()
	#for a in range(10):
	#	var item = pre_item.instance()
	#	item.pos = position[a]
	#	add_child(item)
	#	$timer.start()
	#	yield($timer,"timeout")

func show_hiscores():
	var a = 0 
	for hs in POINTS.hiscores:
		var item = pre_item.instance()
		item.pos = position[a]
		item.nome = hs.nome
		item.score = hs.score
		add_child(item)
		$timer.start()
		yield($timer,"timeout")
		a += 1
		print(hs)
	pass
