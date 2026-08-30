extends Label3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.pot_bought.connect(on_pot_bought)

func on_pot_bought() -> void:
	text = "Nice most cant seem to buy these things\nI was going to make you get this stuff yourself\nBut I like the cut of your jib so here have all the stuff"
