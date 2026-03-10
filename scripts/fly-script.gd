extends CharacterBody2D

var speed = 120.0
var direction = Vector2.ZERO

func _ready():
	$Timer.wait_time = 2.0
	$Timer.autostart = true
	$Timer.timeout.connect(_pick_new_direction)
	$Timer.start()
	_pick_new_direction()

func _pick_new_direction():
	var angle = randf() * 2 * PI
	direction = Vector2(cos(angle), sin(angle))

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()
