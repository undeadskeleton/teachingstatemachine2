extends StateInterface

class_name IdleState

func enter()-> void:
	print("Enter idle state")
	print("Direction in idlestate",statemachine.lastdir)
func physics_update(delta: float)-> void:
	var char = statemachine.get_parent()
	if !char.is_on_floor():
		char.velocity.y += delta * 980

func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept"):
		statemachine.change_state("jumpstate")
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		statemachine.change_state("movestate")
	if Input.is_action_just_pressed("Dash"):
		statemachine.change_state("dashstate")
