extends Label

@export var maxhealth = 150
@export var health = 150


#var checkX = -251
#var checkY = 8

var checkX = -116
var checkY = -501

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "100/100"


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(health)+"/"+str(maxhealth)
	if health <= 0:
		health = maxhealth
		get_tree().reload_current_scene()
		$"..".position.x = checkX
		$"..".position.y = checkY
	if health > maxhealth:
		health=maxhealth
	#print($"..".position.x, $"..".position.y)
	if ($"..".position.x <= -110 and $"..".position.x >= -120) and ($"..".position.y <= -499 and $"..".position.y >= -510):
		checkX = -116
		checkY = -501
		
