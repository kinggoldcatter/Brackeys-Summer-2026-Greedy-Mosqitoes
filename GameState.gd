extends Node

var deamon_there: bool = false 
var interacting: bool = false

signal book_unlocked
signal deamon_summoned
signal pot_bought

signal now_interacting
signal done_interacting

signal got_scammed

func _ready() -> void:
	deamon_summoned.connect(on_deamon_summoned)
	now_interacting.connect(on_now_interacting)
	done_interacting.connect(on_done_interacting)

func on_deamon_summoned() -> void:
	deamon_there = true

func on_now_interacting() -> void:
	interacting = true

func on_done_interacting() -> void:
	interacting = false
