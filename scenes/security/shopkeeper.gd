extends SecurityCamera

func detect_player_stealing(hat):
	if player_is_on_area:
		pass

func _on_flip_side_timer_timeout():
	$Sprite2D.flip_h = !$Sprite2D.flip_h
