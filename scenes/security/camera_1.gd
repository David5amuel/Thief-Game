class_name SecurityCamera extends Area2D

var player_is_on_area : bool

func detect_player_stealing(hat):
	pass

func _on_body_entered(body):
	get_tree().reload_current_scene()
	player_is_on_area = true

func _on_body_exited(body):
	player_is_on_area = false

func _on_change_state_timer_timeout():
	set_deferred("monitoring", !monitoring)
	$CameraVision.visible = !$CameraVision.visible
