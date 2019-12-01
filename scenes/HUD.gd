extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = Vector2(0, 0)
var max_score = 3

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
