extends CanvasLayer


func _ready() -> void:
	# Souscri un abonnement youtube, pour être toujours prêt. 
	Events.score_changed.connect(_on_score_changed)
	Events.game_over.connect(_on_game_over)
	Events.game_started.connect(_on_game_started)
	
	# Test du HUD
	#Events.restart_requested.connect(func() -> void: print("Rejouer demandé !"))   
	#Events.score_changed.emit(12)   
	#Events.game_over.emit(12)  
	# Fin de test

func _on_score_changed(score: int) -> void:
	# Update la propriété text du ScoreLabel
	# % score remplace %d remplace le nombre
	%ScoreLabel.text = "Score : %d" % score

func _on_game_over(final_score: int) -> void:
	%FinalScoreLabel.text = "Perdu ! Score : %d" % final_score
	%GameOverPanel.show()

func _on_game_started() -> void:
	%GameOverPanel.hide()

func _on_restart_button_pressed() -> void:
	Events.restart_requested.emit()
