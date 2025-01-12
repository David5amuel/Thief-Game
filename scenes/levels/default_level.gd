extends Node2D

@export var number_of_hats_to_be_steal := 5
@onready var hats_instances : Array = [load("res://scenes/hats/blue_hat.tscn").instantiate(),
load("res://scenes/hats/red_hat.tscn").instantiate(), load("res://scenes/hats/yellow_hat.tscn").instantiate()]
#@onready var blue_hat : Object = load("res://scenes/hats/blue_hat.tscn").instantiate()
#@onready var red_hat : Object = load("res://scenes/hats/red_hat.tscn").instantiate()
#@onready var yellow_hat : Object = load("res://scenes/hats/yellow_hat.tscn").instantiate()

var last_stolen_hat : Object
var next_hat: Object

func _ready():
	for i in range(0, number_of_hats_to_be_steal):
		var sorted_hat = hats_instances.pick_random()
		var sorted_spawn_position = $HatsSpawnPositions.get_children().pick_random()
		sorted_hat.global_position = sorted_spawn_position.global_position
		$Hats.add_child(sorted_hat.duplicate())
		$HatsSpawnPositions.remove_child(sorted_spawn_position)
		sorted_spawn_position.queue_free()
	next_hat = $Hats.get_child(randi_range(0, $Hats.get_children().size()))

func _on_hats_child_entered_tree(hat):
	hat.hat_was_stolen.connect(_on_hat_hat_was_stolen)
	for security_unity in $GuardsAndCameras.get_children():
		hat.hat_was_stolen.connect(security_unity.detect_player_stealing)
	
func _on_hat_hat_was_stolen(hat):
	if last_stolen_hat != null:
		last_stolen_hat.remove_player_bad_effects($Player)
		last_stolen_hat.queue_free()
	last_stolen_hat = hat
	last_stolen_hat.visible = false
	last_stolen_hat.set_deferred("monitoring", false)
	hat.add_player_bad_effects($Player)
