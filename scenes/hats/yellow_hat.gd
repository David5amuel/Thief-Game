extends HatBlueprint

func add_player_bad_effects(player):
	player.scale = Vector2(2, 2)
	
func remove_player_bad_effects(player):
	player.scale = Vector2(1, 1)