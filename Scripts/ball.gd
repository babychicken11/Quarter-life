extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	print("Player entered the area!")
	# Add your game logic here (e.g., start a timer, disable movement)
	$"../Player/Health".maxhealth += 50
	$"../Player/Health".health += 50
	queue_free()
