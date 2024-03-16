extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	pass # Replace with function body.

func _on_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_Settings_pressed():
	$SettingsMenu.set_process(true)
	$SettingsMenu.visible = true
	pass # Replace with function body.


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/Playground.tscn")
	pass # Replace with function body.
