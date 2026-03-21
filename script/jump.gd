extends StateInterface

class_name JumpState
@export var jump_height : int = -600
func enter()-> void:
	var character = statemachine.get_parent()
	character.velocity.y = jump_height

func physics_update(delta: float)-> void:
	var character = statemachine.get_parent()

	if !character.is_on_floor():
		character.velocity.y += delta * 980
	
	#handle air movement 
	statemachine.direction= Input.get_axis("ui_left","ui_right")
	character.velocity.x = 200 * statemachine.direction
	if character.is_on_floor():
		if statemachine.direction!=0:
			statemachine.change_state("movestate")
		else:
			statemachine.change_state("idlestate")
	
func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("Dash"):
		statemachine.change_state("dashstate")
