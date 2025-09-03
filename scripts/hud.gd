# HUD.gd

extends CanvasLayer

@onready var player_score_label = $PlayerScoreLabel
@onready var ai_score_label = $AIScoreLabel
@onready var game_over_label = $GameOver

# This function will be called by the Game script's signal
func update_scores(player_score, ai_score):
	player_score_label.text = str(player_score)
	ai_score_label.text = str(ai_score)

func show_game_over(winner_name):
	game_over_label.text = "%s Wins!" % winner_name
	game_over_label.show()

func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
