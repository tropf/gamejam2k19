extends Node

var G = 1
var direction = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var v1 = $Ball1.position
	var v2 = $Ball2.position
	var dist = euclidian_distance(v1, v2)
	direction = -1000000000 * get_direction(v1, v2) * G/pow(dist, 2)
	print("distance ", dist, "direction ", direction)
	$Ball1.set_force(delta * direction)
	
func euclidian_distance(v1, v2):
	return sqrt(pow(v1.x - v2.x, 2) + pow(v1.y - v2.y, 2))
	
func get_direction(v1, v2):
	return (v1 - v2).normalized()
