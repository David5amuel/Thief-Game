extends CharacterBody2D

@onready var destinations := $Destinations.get_children()

var is_looking_down : bool
var is_on_destination : bool
var distance_to_destination : Vector2
var current_destination_index := true
var player_is_on_area : bool
var previous_destination : Object
var current_destination : Object

func _ready():
	previous_destination = $Destinations/PointA
	current_destination = $Destinations/PointB

func _process(delta):
	distance_to_destination = abs(global_position - destinations[int(current_destination_index)].global_position)
	
	if !is_on_destination:
		global_position += global_position.direction_to(destinations[int(current_destination_index)].global_position) * 75 * delta
		
	#if (global_position.y < destinations[int(current_destination_index)].global_position.y or global_position.x < destinations[int(current_destination_index)].global_position.x) \
	#and (distance_to_destination.x > 1 or distance_to_destination.y > 1):
	if current_destination.global_position.y >= previous_destination.global_position.y and !is_on_destination:
		$AnimationPlayer.play("walking_down")
		is_looking_down = true
		
	#elif (global_position.y > destinations[int(current_destination_index)].global_position.y or global_position.x > destinations[int(current_destination_index)].global_position.x) \
	#and (distance_to_destination.x > 1 or distance_to_destination.y > 1):
	elif current_destination.global_position.y < previous_destination.global_position.y and !is_on_destination:
		$AnimationPlayer.play("walking_up")
		is_looking_down = false
		
	if distance_to_destination.x <= 1 and distance_to_destination.y <= 1 and !is_on_destination:
		$StandStill.start()
		is_on_destination = true
		if is_looking_down:
			$AnimationPlayer.play("idle_down")
		else:
			$AnimationPlayer.play("idle_up")

func _on_flip_side_timer_timeout():
	$Sprite2D.flip_h = !$Sprite2D.flip_h

func _on_stand_still_timeout():
	previous_destination = destinations[int(current_destination_index)]
	current_destination_index = !current_destination_index
	current_destination = destinations[int(current_destination_index)]
	is_on_destination = false

func _on_player_detector_body_entered(body):
	get_tree().reload_current_scene()
	player_is_on_area = true

func _on_player_detector_body_exited(body):
	player_is_on_area = false
	
func detect_player_stealing(hat):
	pass
	#if player_is_on_area:
		#get_tree().reload_current_scene()
