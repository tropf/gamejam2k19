extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var init_text = "Ready!"
var number_init = 4
var number = number_init
var sound = true

signal done

func _ready():
	$beep_low.stream.loop = false
	$beep_low.volume_db = -20
	$beep_high.stream.loop = false
	$beep_high.volume_db = -17

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
		if sound:
			$beep_low.play()
		$Timer.start()
	else:
		if sound:
			$beep_high.play()
		$Timer.stop()
		emit_signal("done")
