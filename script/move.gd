extends StateInterface

class_name MoveState

@export var Speed : int = 300

func enter()-> void:
	print("Entering move state")

func physics_update(delta: float)-> void:
	var character=statemachine.get_parent()
	
	if !character.is_on_floor():
		character.velocity.y +=delta*980
		
	var direction = Input.get_axis("ui_left","ui_right")
	statemachine.lastdir = sign(direction)
	if direction==0:
		statemachine.change_state("idlestate")
		
	character.velocity.x = direction * Speed

func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_up"):
		statemachine.change_state("jumpstate")
	if Input.is_action_just_pressed("Dash"):
		statemachine.change_state("dashstate")
