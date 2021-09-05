extends KinematicBody2D
class_name Box

func pushed(velocity : Vector2):
	velocity = move_and_slide(velocity)
	
