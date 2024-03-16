#The pause control node for the GUI.
#Appears whenever the player presses the "pause" InputAction
#Pauses everything in the game and lets them select options or go into the settings
#Note: This should only exist as a child of the GUI node. Do NOT create multiple instances of me

extends Control

var is_paused = false setget set_is_paused

#Triggers whenever the is_paused is modified (or read??)
#Params: bool newValue - whatever the new value of is_paused became
func set_is_paused(newValue):
	is_paused = newValue
	get_tree().paused = is_paused
	visible = is_paused
	pass

#if player presses pause button (And nothing catches it) 
#toggle pause var and trigger set_is_paused with the setget
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.is_paused = !is_paused

# Called when the node enters the scene tree for the first time.
func _ready():
	$SettingsMenu.visible = false
	$SettingsMenu.set_process(false)

func _on_Quit_pressed():
	get_tree().quit()

#unpause the game, then change scenes.
#If you don't unpause the mainMenu will be frozen and unreactable!
func _on_ReturnToTitle_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

#enable the optionsMenu on top of the scene
#I assume the SettingsMenu is part of the scene as a direct child. You could also spawn a node if you really wanted to
func _on_Settings_pressed():
	$SettingsMenu.set_process(true)
	$SettingsMenu.visible = true
	pass # Replace with function body.

func _on_Resume_pressed():
	self.is_paused = false
