extends Area2D

var horizontalSpeed = 100
var verticalSpeed = 200


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
		horizontalSpeed -= horizontalSpeed * 2
		
	if body.name == "BottomWall":
		print("Hit the bottom Wall!")
		# Reverse the vertical direction
		verticalSpeed -= verticalSpeed * 2
