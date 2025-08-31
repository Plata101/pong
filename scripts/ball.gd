extends Area2D


# 1. DECLARE THE SIGNAL
# This defines a new signal our ball can send out. The parameter name
# helps us remember what kind of data it carries.
signal direction_changed(is_moving_towards_ai)

var horizontalSpeed = 300
var verticalSpeed = 150

var rng = RandomNumberGenerator.new()



func _ready():
	var my_random_number = rng.randf_range(-50.0, 50.0)
	global_position.y += my_random_number



func _physics_process(delta):
	# Move based on the velocity vector
	global_position.x += -horizontalSpeed * delta
	global_position.y += verticalSpeed * delta

func _on_body_entered(body):
	print("body")
	# Check if the body that entered is the player paddle
	if body.name == "Player Paddle":
		print("Hit the player paddle!")
		# Reverse the horizontal direction
		horizontalSpeed = -200
		# 2. EMIT THE SIGNAL
		# We tell all listening nodes that the ball is now moving towards the AI.
		direction_changed.emit(true)
		
	if body.name == "BottomWall":
		print("Hit the bottom Wall!")
		# Reverse the vertical direction
		verticalSpeed = -200 
		
	if body.name == "TopWall":
		print("Hit the top Wall!")
		# Reverse the vertical direction
		verticalSpeed = 200
		
	if body.name == "AI Paddle":
		print("Hit the ai paddle!")
	# Reverse the horizontal direction
		horizontalSpeed = 200
	# 	2. EMIT THE SIGNAL
		# We tell all listening nodes that the ball is NOT moving towards the AI.
		direction_changed.emit(false)
