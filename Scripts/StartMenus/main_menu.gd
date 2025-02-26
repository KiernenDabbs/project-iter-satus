extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


#Button functions
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/World/Levels/Level 0.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartMenus/options_menu.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
