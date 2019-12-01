extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = Vector2(0, 0)
var max_score = 17
var powerup_markers = []

signal max_score_reached

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func dump_score():
	$score_player.text = str(score.x)
	$score_enemy.text = str(score.y)

func change_score(playerdiff = 0, enemydiff = 0):
	score += Vector2(playerdiff, enemydiff)
	dump_score()
	if score.x >= max_score or score.y >= max_score:
		emit_signal("max_score_reached")

func set_powerup_stop_count(curr):
	var start_pos = $powerup_pos_marker.position
	var delta_pos = Vector2(56, 0)
	while curr > powerup_markers.size():
		# spawn new markers
		var new_marker = preload("res://scenes/powerup_stop.tscn").instance()
		new_marker.set_pause_mode(PAUSE_MODE_STOP)
		new_marker.position = start_pos + powerup_markers.size() * delta_pos
		powerup_markers.append(new_marker)
		add_child(new_marker)
		
	while curr < powerup_markers.size():
		# delete markers
		var last = powerup_markers.back()
		last.queue_free()
		powerup_markers.remove(powerup_markers.size() - 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
