extends Node3D

@export var discArr : Array[MeshInstance3D] = []
var disc = 0
@export var arrowHolder : Node3D
var numArr = []
var numStr = ""

var answer = "567"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if discArr.size() != 3:
		push_warning("ERROR: wrong number of discs")
	
	numArr.append(0)
	numArr.append(0)
	numArr.append(0)
	
	_updateNum()
	print(numStr)

func _input(event):
	if event.is_action_pressed("lockLeft"):
		if(disc>0):
			disc-=1
			#print("disc: "+str(disc))
		#else:
			#print("disc at left")
	elif event.is_action_pressed("lockRight"):
		if(disc<2):
			disc+=1
			#print("disc: "+str(disc))
		#else:
			#print("disc at right")
	
	if(disc==0):
		arrowHolder.position.x = -0.115
	elif(disc==1):
		arrowHolder.position.x = 0
	elif(disc==2):
		arrowHolder.position.x = 0.115
	
	var curr = round(discArr[disc].rotation_degrees.x)
	var changed = false
	
	if event.is_action_pressed("discUp"):
		curr = curr + 36
		changed = true
	elif event.is_action_pressed("discDown"):
		curr = curr - 36
		changed = true
		
	if changed:
		var temp = "\n"+str(curr)
		curr = fmod(curr+360, 360)
		temp = temp + " -> "+str(curr)
		#print(temp)
		
		discArr[disc].rotation_degrees.x=round(curr)
		#var testStr = "rotation:"+str(discArr[disc].rotation_degrees.x)
		#print(testStr)
		_updateNum()
		#print("num: "+numStr)
		
	if event.is_action_pressed("checkLock"):
		print("\n"+numStr + " = [" +answer+"]")
		
		if(numStr==answer):
			print("correct!")
		else:
			print("try again")
		

func _updateNum():
	var rot = round(discArr[0].rotation_degrees.x)
	numArr[0] = rot/36.0
	
	rot = round(discArr[1].rotation_degrees.x)
	#testStr = testStr +", "+str(rot)
	numArr[1] = rot/36.0
	
	rot = round(discArr[2].rotation_degrees.x)
	#testStr = testStr +", "+str(rot)
	numArr[2] = rot/36.0
	
	
	#numStr = "= = = ="
	numStr = str(int(numArr[0]))+str(int(numArr[1]))+str(int(numArr[2]))
	#numStr += "\n= = = ="
	
