extends Camera2D

onready var topLeft = $camLimit/topLeft
onready var bottomRight = $camLimit/bottomRight

func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottomRight.position.y
	limit_right = bottomRight.position.x
