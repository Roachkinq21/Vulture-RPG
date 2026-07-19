extends Node

var battling : bool = false

signal battle_started
signal battle_ended(_result : BATTLE_RESULT)


## BATTLE RESULT ##
enum BATTLE_RESULT {
	NA,
	PLAYER_WIN,
	ENEMY_WIN
}

