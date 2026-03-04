extends StateInterface

class_name DashState
@export var dash_speed : float = 600
@export var dash_time : float = 0.4
var dash_timer : float = 0.0

func enter()-> void:
	print("Enter dash state")
	var character = statemachine.get_parent()
	var direction = Input.get_axis("ui_left","ui_right")
	
	if direction==0:
		direction = statemachine.lastdir
		statemachine.lastdir = direction
	
	character.velocity.x = direction * dash_speed
	dash_timer = dash_time
	
func physics_update(delta: float)-> void:
	print("Time remaning:",dash_timer)
	dash_timer-=delta
	if dash_timer<=0:
		var direction = Input.get_axis("ui_left","ui_right")
		if direction==0:
			statemachine.change_state("idlestate")
		else:
			statemachine.change_state("movestate")
