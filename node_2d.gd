extends Node2D

var board = [[0,1,2,3], [4,5,6,7], [8,9,10,11], [12,13,14,15]]
var imgNode = preload("res://SlidePuzzleImage.tscn")
var img = []

var speed = 4

var section1 = -1
var section2 = -1
var node1
var node2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var counter = 0
	for x in range(16):
		var section = imgNode.instantiate()
		section.get_child(0).frame = x
		img.append(section)
	img.shuffle()
	for x in range(16):
		img[x].position = Vector2(counter*64, (x/4)*64)
		counter += 1
		if counter == 4:
			counter = 0
		add_child(img[x])
	print(get_children().size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_swap_images()
	if Input.is_action_just_pressed("ui_accept"):
		print(section1)

func _swap_images():
	if section1 != -1 && section2 != -1:
		move_child(get_child(section1), section2)
		move_child(get_child(section2-1) if section1 < section2 else get_child(section2+1), section1)
		var temp = get_child(section1).position
		get_child(section1).position = get_child(section2).position
		get_child(section2).position = temp
		section1 = -1
		section2 = -1
	var count = 0
	for n in get_children():
		if n.get_child(0).frame != count:
			break
		count += 1
		if count >= get_children().size():
			print("success")
