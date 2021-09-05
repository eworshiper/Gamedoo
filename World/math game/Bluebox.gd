extends KinematicBody2D

onready var raycast = $RayCast2D
var grid_size = 16
var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT
}

func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(direction)

func move(direction):
	var vector_pos = inputs[direction] * grid_size
	raycast.cast_to = vector_pos
	raycast.force_raycast_update()
	if !raycast.is_colliding():
		position += vector_pos
	else:
		var collider = raycast.get_collider()
		if collider.is_in_group('box'):
			if collider.move(direction):
				position =+ vector_pos
