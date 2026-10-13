# Snake Quest

Jeu de snake réalisé avec Godot.

> Statut : en développement

## Les règles d'or

- Une tâche = une branche, créée depuis main à jour. Son nom est donné dans l'encadré « Git » de chaque tâche (ex. p1-e2-nourriture).
- Jamais de commit directement sur main : main ne change que par des Pull Requests.
- Pas de fork : un seul dépôt GitHub (origin), où vous publiez vos branches.
- Chaque Pull Request est relue par l'autre avant la fusion.
- Des petits commits fréquents, avec des messages clairs (« Ajoute la scène Food »).
- Une scène .tscn = une seule personne à la fois, même sur des branches différentes : les scènes se fusionnent très mal. Annoncez-vous : « je  prends main.tscn ».
- Après une fusion : retour sur main, Pull, et suppression de la branche.
- Un conflit ? Pas de panique, on ne force rien : on appelle Rémy.

## Prérequis

- Godot 4.7 (rendu GL Compatibility)

## Lancer le jeu

1. Ouvrir Godot.
2. Importer le dossier du projet (`project.godot`).
3. Lancer la scène principale (`main/main.tscn`) avec F5.

## Contrôles

| Touche | Action |
|--------|--------|
| À compléter | À compléter |

## Structure du projet

```
snake-quest/
├── main/    # Scène principale et logique du jeu
├── snake/   # Le serpent
├── food/    # La nourriture
├── ui/      # Interface (HUD, score)
├── art/     # Images et sprites
└── audio/   # Sons et musiques
```

## Fonctionnalités

- [ ] Déplacement du serpent
- [ ] Nourriture et croissance
- [ ] Score
- [ ] Game over

## Équipe

- Rémy Nicolas
- À compléter
- Elton était là