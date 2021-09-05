extends Node

var is_playing : bool = false


func play_bkg():
	$BkgMusic.playing = true
	is_playing = true

func play_powerup():
	$Poweup.play()

func play_explosion():
	$Explosion.play()
