extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


#Button functions
func _on_volume_button_pressed() -> void:
	pass # Replace with function body.

func _on_unused_button_1_pressed() -> void:
	pass # Replace with function body.

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartMenus/main_menu.tscn")
