extends Area2D

export(String, FILE) var nextRoom : String = ""

func _on_Door_body_entered(body):
	if body.is_in_group("Player") and nextRoom != "":
		get_tree().change_scene(nextRoom)
