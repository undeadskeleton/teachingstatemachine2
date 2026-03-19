extends Node


class_name StateMachine

var states : Dictionary = {}
var current_state : StateInterface
var currentstatename : String 
@export var initial_state : StateInterface

var lastdir : int = 1

func _ready()-> void:
	#Take all the children under StateMachine node  
	for child in get_children():
		if child is StateInterface:
			states[child.name.to_lower()] = child
			child.statemachine = self
			
	#Start 
	if initial_state:
		change_state(initial_state.name.to_lower())
		
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func change_state(new_state_name: String)-> void:
	if current_state:
		current_state.exit()
		
	currentstatename=new_state_name
	current_state = states.get(currentstatename.to_lower())
	if current_state:
		current_state.enter()

func get_current_state()-> String:
	return currentstatename
