extends StateInterface

class_name JumpState

func enter()-> void:
	print("Enter jump state")
	var character = statemachine.get_parent()
	character.velocity.y = -600

func physics_update(delta: float)-> void:
	var character = statemachine.get_parent()
	
	if !character.is_on_floor:
		character.velocity.y += delta * 980
	
	#handle air movement 
	
	var direction= Input.get_axis("ui_left","ui_right")
	
	character.velocity.x = 200 * direction

func handle_input(event: InputEvent)-> void:
	var character = statemachine.get_parent()
	
	if character.is_on_floor:
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			statemachine.change_state("movestate")
		else:
			statemachine.change_state("idlestate")
