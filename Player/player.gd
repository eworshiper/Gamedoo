extends KinematicBody2D

const acceleration = 150
const maxSpeed = 40
const friction = 200
const push_speed = 200

var velocity = Vector2.ZERO

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector = inputVector.normalized()
	
	if inputVector != Vector2.ZERO:
		animationTree.set("parameters/idle/blend_position", inputVector)
		animationTree.set("parameters/run/blend_position", inputVector)
		animationState.travel("run")
		velocity = velocity.move_toward(inputVector * maxSpeed, acceleration * delta)
	else :
		animationState.travel("idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

	velocity = move_and_slide(velocity)
	
	if get_slide_count() > 0:
		check_box_collision(inputVector)

	
func check_box_collision(inputVector : Vector2):
	if abs(inputVector.x) + abs(inputVector.y) > 1:
		return
	var box = get_slide_collision(0).collider as Box
	if box:
		box.pushed(push_speed*inputVector)
