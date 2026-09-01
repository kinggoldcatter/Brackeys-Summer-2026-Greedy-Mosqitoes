extends Node3D
class_name Phone

signal phone_called

var deamon_called: bool = false

const PHONE_NUM_LEN: int = 6
const CORRECT_PHONE_NUM: String = "456972"

var phone_num: String = ""

func input_num(num: String) -> void:
	phone_num += num
	if phone_num.length() == PHONE_NUM_LEN:
		if phone_num == CORRECT_PHONE_NUM and !deamon_called:
			print("Correct Number")
			phone_called.emit()
			deamon_called = true
			GameState.deamon_summoned.emit()
		else:
			print("lol bad at numbers")
			$AudioStreamPlayer3D.play()
		phone_num = ""
	print(phone_num) 
