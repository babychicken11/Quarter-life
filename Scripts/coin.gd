extends Area2D



func _on_body_entered(body: Node2D) -> void:
	print("Player entered the area!")
	# Add your game logic here (e.g., start a timer, disable movement)
	queue_free()
	$"../Player/Health".health += 50
