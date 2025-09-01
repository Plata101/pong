extends Area2D


# 1. DECLARE THE SIGNAL
# This defines a new signal our ball can send out. The parameter name
# helps us remember what kind of data it carries.
signal direction_changed(is_moving_towards_ai)

var horizontalSpeed

var rng = RandomNumberGenerator.new()

var verticalSpeed = rng.randf_range(150.0, 300.0)
var my_random_number = rng.randf_range(-50.0, 50.0)


func _ready():
	if my_random_number > 0:
		horizontalSpeed = 300
		global_position.y += my_random_number
		direction_changed.emit(false)
	else:
		horizontalSpeed = -300	
		global_position.y += my_random_number
		direction_changed.emit(true)

func start_moving():
	# This function resets the ball's speed and gives it a new random direction
	my_random_number = rng.randf_range(-50.0, 50.0)
	global_position.y += my_random_number
	if my_random_number > 0:
		horizontalSpeed = 300
		verticalSpeed = rng.randf_range(150.0, 300.0)
		direction_changed.emit(false)
	else:
		horizontalSpeed = -300	
		verticalSpeed = rng.randf_range(150.0, 300.0)
		direction_changed.emit(true)


func _physics_process(delta):
	# Move based on the velocity vector
	global_position.x += -horizontalSpeed * delta
	global_position.y += verticalSpeed * delta

func _on_body_entered(body):
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

func stop_moving():
	# Set speeds to 0 to stop the ball while it's hidden
	horizontalSpeed = 0
	verticalSpeed = 0
