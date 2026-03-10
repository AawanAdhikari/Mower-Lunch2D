extends AnimatableBody2D

var speed = 100.0
var move_distance = 408.0
var start_position = global_position
var direction = 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	position.y += speed * direction * delta
	
	# If moved far enough down, go back up
	if position.y > 300:
		direction = -1
	# If moved far enough up, go back down
	if position.y < 0: 
		direction = 1
