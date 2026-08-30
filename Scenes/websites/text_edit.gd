extends TextEdit

@onready var web_browser = get_tree().get_first_node_in_group("web_browser")

@onready var real_site = preload("res://Scenes/www,calculcaucac,wiz.tscn")
@onready var fake_site = preload("res://Scenes/scam website.tscn")
@onready var browser = preload("res://Scenes/websites/browser.tscn")

@onready var current_site: Node = $"../Browser"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("checkLock"):
		print(text)
		if text.strip_edges().to_lower()== "www.calculcaucac.wiz":
			var new_site: Node = real_site.instantiate()
			web_browser.add_child(new_site)
			current_site.queue_free()
			current_site = new_site
			move_to_front()
			
		elif text.strip_edges().to_lower() == "www.culcalcaccau.wiz":
			var new_site: Node = fake_site.instantiate()
			web_browser.add_child(new_site)
			current_site.queue_free()
			current_site = new_site
			move_to_front()
		
		elif  text.strip_edges().to_lower() == "wizbowz.orb":
			var new_site: Node = browser.instantiate()
			web_browser.add_child(new_site)
			current_site.queue_free()
			current_site = new_site
			move_to_front()
		text = ""
