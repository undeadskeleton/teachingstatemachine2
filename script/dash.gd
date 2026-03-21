extends StateInterface

class_name DashState
@export var dash_speed : float = 1000
@export var dash_time : float = 0.16
var dash_timer : float = 0.0
var savedirection : int

func enter()-> void:
	#print("Enter dash state")
	var character = statemachine.get_parent()
	statemachine.direction = Input.get_axis("ui_left","ui_right")
	
	if statemachine.direction == 0:
		statemachine.direction = statemachine.lastdir
	
	character.velocity.x = statemachine.direction * dash_speed
		#statemachine.lastdir = direction
	dash_timer = dash_time
	
func physics_update(delta: float)-> void:
	dash_timer-=delta
	if dash_timer<=0:
		#statemachine.direction=0
		var direction = Input.get_axis("ui_left","ui_right")
		#print("after timer end direction: ",direction)
		if statemachine.direction==0:
			statemachine.change_state("idlestate")
		else:
			statemachine.change_state("movestate")
