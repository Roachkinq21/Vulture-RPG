extends Resource
class_name Battler

@export var is_player : bool
@export var name : String = "Player"

@export var health : float
@export var mana : float
@export var defence : int
@export var level : int = 1

@export var abilities : Array

func level_up():
    match level:
        1:
            pass
        2:
            pass
        3:
            pass
        5:
            pass
        7:
            pass
        10:
            pass
        15:
            pass
        20:
            pass
        