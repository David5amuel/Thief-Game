class_name HatBlueprint extends Area2D

signal hat_was_stolen(hat)

var is_player_on_area : bool

func _ready():
	$Sprite2D.frame_coords.y = randi_range(0, 5)

func _process(delta):
	if is_player_on_area and Input.is_action_just_pressed("steal"):
		hat_was_stolen.emit(self)

func _on_body_entered(body):
	is_player_on_area = true

func _on_body_exited(body):
	is_player_on_area = false

func add_player_bad_effects(player):
	pass
	
func remove_player_bad_effects(player):
	pass
