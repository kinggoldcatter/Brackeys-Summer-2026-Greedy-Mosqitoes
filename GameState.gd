extends Node

var deamon_there: bool = false 

signal book_unlocked
signal deamon_summoned
signal pot_bought

signal got_scammed

func _ready() -> void:
	deamon_summoned.connect(on_deamon_summoned)

func on_deamon_summoned() -> void:
	deamon_there = true
