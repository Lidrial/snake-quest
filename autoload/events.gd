extends Node

## Le tableau d'annonces du jeu : chacun annonce ou écoute ces signaux,
## sans avoir besoin de connaître les scènes des autres.

##			Signal				Annoncé par							Écouté par
#	game_started				main.gd (Rémy)						hud.gd (Elton) : cache le panneau Game Over
#	score_changed(score)		main.gd (Rémy)						hud.gd (Elton) : affiche le score
#	food_moved(cell)			main.gd (Rémy)						food.gd (Elton) : la pomme se déplace
#	game_over(final_score)		main.gd (Rémy)						hud.gd (Elton) : affiche le panneau
#	restart_requested			hud.gd (Elton), bouton Rejouer		main.gd (Rémy) : relance une partie

# Les signaux sont émis par d'autres scripts : on coupe l'avertissement « signal inutilisé ».
@warning_ignore_start("unused_signal")

## Une nouvelle partie commence.
signal game_started
## Le score vient de changer.
signal score_changed(score: int)
## La pomme est placée sur une nouvelle case.
signal food_moved(cell: Vector2i)
## La partie est finie.
signal game_over(final_score: int)
## Le joueur demande a rejouer (bouton du HUD).
signal restart_requested
