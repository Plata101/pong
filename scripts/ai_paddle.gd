extends CharacterBody2D

#get reference to the ball node
@export var ball: Node2D

# This will track whether the AI should be active
var is_ball_coming_towards_me = false

func _on_ball_direction_changed(is_moving_towards_ai):
	# This function will be connected to the ball's signal.
	# It updates our tracking variable with the value from the ball.
	is_ball_coming_towards_me = is_moving_towards_ai
	print("AI received signal. Ball coming? ", is_ball_coming_towards_me)


var currentBallPosition

func _ready():
	currentBallPosition = ball.global_position.x


func _physics_process(delta):
	if ball == null:
		return


	
	
		
