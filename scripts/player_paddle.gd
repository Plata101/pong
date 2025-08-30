extends CharacterBody2D

@onready var paddle = $Sprite2D

func _physics_process(delta):
	if Input.is_action_pressed("PaddleDown"):
		paddle.global_position.y -= -5
	if Input.is_action_pressed("PaddleUp"):
		paddle.global_position.y -= 5
	
