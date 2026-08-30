extends TextEdit

@onready var web_browser = get_tree().get_first_node_in_group("web_browser")

@onready var real_site = preload("res://Scenes/www,calculcaucac,wiz.tscn")
@onready var fake_site = preload("res://Scenes/websites/scam website.tscn")
@onready var browser = preload("res://Scenes/websites/browser.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("checkLock"):
		print(text)
		if text.strip_edges()== "www.calculcaucac.wiz":
			web_browser.add_child(real_site.instantiate())
			$"..".queue_free()
		elif text.to_lower() == "www.culcalcaccau.wiz":
			web_browser.add_child(fake_site.instantiate())
			$"..".queue_free()
		elif  text.to_lower() == "WIZBROWZ.ORB":
			web_browser.add_child(browser.instantiate())
			$"..".queue_free()
