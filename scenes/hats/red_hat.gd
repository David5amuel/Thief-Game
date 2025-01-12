extends HatBlueprint

func add_player_bad_effects(player):
	player.inverse_direction = -1
	
func remove_player_bad_effects(player):
	player.inverse_direction = 1
