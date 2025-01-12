extends SecurityCamera

func detect_player_stealing(hat):
	pass

func _on_flip_side_timer_timeout():
	$Sprite2D.flip_h = !$Sprite2D.flip_h
