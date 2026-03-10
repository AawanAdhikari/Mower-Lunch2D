extends Area2D

var speed = 400.0
var direction = Vector2.ZERO
var lifetime = 0.3

func _ready():
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _physics_process(delta):
	position += direction * speed * delta
	lifetime -= delta
	if lifetime <= 0:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("flies"):
		body.queue_free()
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("coins"):
		area.collected()
		# Tell the player to add a coin
		get_parent().get_node("player").add_coin()
		queue_free()
