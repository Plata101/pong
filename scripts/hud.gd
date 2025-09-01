# HUD.gd

extends CanvasLayer

@onready var player_score_label = $PlayerScoreLabel
@onready var ai_score_label = $AIScoreLabel

# This function will be called by the Game script's signal
func update_scores(player_score, ai_score):
	player_score_label.text = str(player_score)
	ai_score_label.text = str(ai_score)
