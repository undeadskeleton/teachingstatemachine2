extends StateInterface

class_name MoveState

@export var Speed : int = 300
var lastdir : int
func enter()-> void:
	pass

func physics_update(delta: float)-> void:
	var character=statemachine.get_parent()
	if !character.is_on_floor():
		character.velocity.y +=delta*980
		
	statemachine.direction = Input.get_axis("ui_left","ui_right")
	lastdir=statemachine.lastdir
	statemachine.lastdir = sign(statemachine.direction)
	if statemachine.direction==0:
		statemachine.lastdir=lastdir
		statemachine.change_state("idlestate")
		
	character.velocity.x = statemachine.direction * Speed

func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept"):
		statemachine.change_state("jumpstate")
	if Input.is_action_just_pressed("Dash"):
		statemachine.change_state("dashstate")
