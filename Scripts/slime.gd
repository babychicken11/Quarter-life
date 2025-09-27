extends Area2D

var movement = "right"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x > 700:
		movement = "left"
	if position.x < -125:
		movement = "right"
	if movement == "right":
		position.x += 1
	else:
		position.x -= 1
		
func _on_body_entered(body: Node2D) -> void:
	print("Player entered the area!")
	if body.name == "Player":
		# Add your game logic here (e.g., start a timer, disable movement)
		#queue_free()
		$"../Player/Health".health -= 15
		$"../Player".velocity.y = -460
	#print(position.x)
