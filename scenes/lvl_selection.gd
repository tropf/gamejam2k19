extends Node2D

var selected_level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouse:
		if BUTTON_LEFT & event.button_mask:
			print("level ", selected_level, " selected")
			if selected_level == 2:
				Global.current_level_instance = preload("res://scenes/level2.tscn").instance()

func _on_TextureRect_mouse_entered():
	selected_level = 1

func _on_TextureRect2_mouse_entered():
	selected_level = 2
