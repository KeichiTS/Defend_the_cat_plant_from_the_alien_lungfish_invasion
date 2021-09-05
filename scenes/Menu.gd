extends PopupPanel


func _ready():
	pass


func _on_Button_pressed():
	get_tree().paused = false
	hide()


func _on_Volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear2db(value))


func _on_CheckButton_toggled(button_pressed):
	if ! $MarginContainer/VBoxContainer/HBoxContainer/Mute.pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),false)
	if $MarginContainer/VBoxContainer/HBoxContainer/Mute.pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"),true)


func _on_Volume_bkg_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("bkg_music"),linear2db(value))


func _on_Mute_bkg_toggled(button_pressed):
	if ! $MarginContainer/VBoxContainer/HBoxContainer2/Mute_bkg.pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("bkg_music"),false)
	if $MarginContainer/VBoxContainer/HBoxContainer2/Mute_bkg.pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("bkg_music"),true)



func _on_Mute_sfx_toggled(button_pressed):
	if ! $MarginContainer/VBoxContainer/HBoxContainer3/Mute_sfx.pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("sfx"),false)
	if $MarginContainer/VBoxContainer/HBoxContainer3/Mute_sfx.pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("sfx"),true)


func _on_Volume_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("sfx"),linear2db(value))
