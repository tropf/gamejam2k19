extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.peer:
		Global.peer.close_connection()
		Global.peer = null
	if Global.won:
		get_tree().change_scene_to(preload("res://scenes/wonscreen.tscn"))
	else:
		get_tree().change_scene_to(preload("res://scenes/lossscreen.tscn"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
