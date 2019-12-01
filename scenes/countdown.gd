extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var init_text = "Ready!"
var number_init = 4
var number = number_init

signal done

func _on_Timer_timeout():
	number -= 1
	update_status()

func start():
	number = number_init
	$Label.text = init_text
	$Timer.start()

func update_status():
	$Label.text = str(number)
	if number > 0:
		$Timer.start()
	else:
		$Timer.stop()
		emit_signal("done")