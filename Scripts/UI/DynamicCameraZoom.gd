#This Camera2D should be in every scene. It dynamically zooms in or out based on the resolution.
#That way the player's view looks the same regardless of what resolution is conneced
#Make sure "Current" is selected for at least one camera at all times so the viewport doesn't glitch out

extends Camera2D

var base_resolution = Vector2(1024, 600)  # The base resolution for comparison

func _ready():
	get_tree().root.connect("size_changed", self, "_on_viewport_size_changed") #Connect the signal from the root whenever the resolution changes
	update_zoom()

#Triggered when the resolution changes
func _on_viewport_size_changed():
	update_zoom()

#updates the zoom of the camera so all the non-UI elements still take up
#the same amount of space regardless of resolution size.
func update_zoom():
	# Get the current viewport size
	var viewport_size = get_viewport_rect().size
	
	# Calculate the zoom factor
	var zoom_factor = base_resolution / viewport_size
	
	# Set the zoom level of the Camera2D
	zoom = zoom_factor
