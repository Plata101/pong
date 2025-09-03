extends Node2D

# 1. Define a signal to broadcast score changes.
signal score_updated(player_score, ai_score)

@onready var ball = $Ball
@onready var hud = $HUD
@onready var reset_timer = $ResetTimer # Make sure you have a Timer node named this

var player_score = 0
var ai_score = 0

const WIN_SCORE = 3

func _ready():
	# Connect our signal to the HUD's update function (we'll create this next)
	score_updated.connect(hud.update_scores)
	
	# Connect the timer's timeout signal to our ball reset function
	reset_timer.timeout.connect(_on_reset_timer_timeout)


func game_over(winner_name):
	# Stop the ball and pause the whole game
	ball.stop_moving()
	get_tree().paused = true
	
	# Tell the HUD to show the game over screen
	hud.show_game_over(winner_name)



func _on_player_goal_area_entered(area):
	print("Player Goal entered")
	ai_score += 1
	score_updated.emit(player_score, ai_score) # Send the new scores
	if ai_score >= WIN_SCORE:
		game_over("Computer")
	else:
		reset_ball()


func _on_ai_goal_area_entered(area):
	print("AI Goal Entered")
	player_score += 1
	score_updated.emit(player_score, ai_score) # Send the new scores
	if player_score >= WIN_SCORE:
		game_over("Player")
	else:
		reset_ball()
	
func reset_ball():
	# Instead of freeing, just hide the ball and start a timer
	ball.hide()
	# Stop its movement by calling a function on the ball script
	ball.stop_moving() 
	reset_timer.start(1) # Start a 1-second timer

func _on_reset_timer_timeout():
	# This runs after the timer finishes
	ball.show()
	ball.global_position = get_viewport_rect().size / 2
	ball.start_moving()
