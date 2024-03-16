#The menu for changing the resolution of the game
extends Control

onready var ResOptionButton = $Options/ResolutionContainer/OptionButton #Get the drop-down so we can add the resolution dictionary
onready var FullScreenToggle = $Options/FullScreenContainer/FullScreenToggle #Get the toggle so we can automatically set it to true/false
onready var VSyncToggle = $Options/VSyncContainer/VSyncToggle#Get the toggle so we can automatically set it to true/false

#The list of resolutions to run the game at. Add any and it wil lautomatically be added to the drop-down button
var Resolutions: Dictionary = {"3840x2160":Vector2(3840,2160),
								"2560x1440":Vector2(2560,1440),
								"1920x1080":Vector2(1920,1080),
								"1366x768":Vector2(1366,768),
								"1536x864":Vector2(1536,864),
								"1280x720":Vector2(1280,720),
								"1440x900":Vector2(1440,900),
								"1600x900":Vector2(1600,900),
								"1024x600":Vector2(1024,600),
								"800x600": Vector2(800,600)}

func _ready():
	AddResolutions()
	#Then set the checkboxes to true or false based on what's enabled
	VSyncToggle.set_pressed_no_signal(OS.is_vsync_enabled())
	FullScreenToggle.pressed = OS.is_window_fullscreen() #set the fullscreen toggle to whether the game is already fullscreen

#Add each supported resolution to the dropdown options 
func AddResolutions():
	var CurrentResolution = get_viewport().get_size()
	var Index = 0 
	for r in Resolutions:
		ResOptionButton.add_item(r,Index)
		if Resolutions[r] == CurrentResolution: #If the player's resolution matches the one being added to the dropdown list, automatically make it so the player's resolution is the first one selected
			ResOptionButton._select_int(Index) 
		Index += 1

#Change the resolution to the one selected by the user from the resolution dropdown
#Params: int Index: which item was selected (starts from 0)
func _on_OptionButton_item_selected(index):
	var size = Resolutions.get(ResOptionButton.get_item_text(index))
	OS.set_window_size(size)
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT,SceneTree.STRETCH_ASPECT_KEEP,size)

#Toggle fullscreen based on the toggle
#Params: bool button_pressed - if the button is selected or not
func _on_FullScreenToggle_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)
	if button_pressed == false:
		var size = get_viewport().get_size()
		OS.set_window_size(size)
		OS.center_window()

#Toggle VSync based on the toggle
#Params: bool button_pressed - if the button is selected or not
func _on_VSyncToggle_toggled(button_pressed):
	OS.set_use_vsync(button_pressed)
	pass # Replace with function body.

#The $"." selects the parent node up one (the Resolution node) 
#So revert it so we're paused and not visible.
func _on_Back_pressed():
	$".".set_process(false)
	$".".visible = false
	pass # Replace with function body.
