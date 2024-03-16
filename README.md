# ResolutionBase
A base template for Godot 3 games where the player can change the resolution at any time. It also has a camera that dynamically zooms in or out based on the resolution so the player can't see unintended parts of the scene.
Made so I can just copy and paste it for new projects with a basic settings screen. But you may find it helpful as well. Just hit play and it will take you to an example scene where you can see how different resolutions do (or in this case don't) affect the look of the scene.

Made in Godot 3.5.3.
License with Unlicense. Do whatever you want with it.

Notes:
-If you do not want the camera zoom to change, just remove the script from the Camera2D Node. Be aware this means the player will see more or less of the scene if they change the resolution.


-The Pause and Settings menus are intended to only have a single instance from the "GUI" node. They will stay hidden and detect the player pressing the pause button. Add the GUI Node to every new level if you want the player to be able to pause and change settings there. Do not add the settings scenes.
