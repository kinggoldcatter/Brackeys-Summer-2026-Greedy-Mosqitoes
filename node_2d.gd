extends Node2D

var board = [[0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15]]
var imgNode = preload("res://SlidePuzzleImage.tscn")
var img = []

var speed = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var counter = 0
	for x in range(16):
		var section = imgNode.instantiate()
		section.position = Vector2(counter*64, (x/4)*64)
		counter += 1
		if counter == 4:
			counter = 0
		section.get_child(0).frame = x
		img.append(section)
		add_child(img[x])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
