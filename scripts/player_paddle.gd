extends CharacterBody2D

@export var paddleSpeed = 300

func _physics_process(delta):
	if Input.is_action_pressed("PaddleDown"):
		if global_position.y < 585:
			global_position.y -= -paddleSpeed * delta
	if Input.is_action_pressed("PaddleUp"):
		if global_position.y > 60:
			global_position.y -= paddleSpeed * delta
	
