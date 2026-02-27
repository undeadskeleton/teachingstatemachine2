extends Node

class_name StateInterface

var statemachine : StateMachine

func enter()-> void:
	pass

func exit()-> void:
	pass

func physics_update(delta: float)-> void:
	pass

func update(delta: float)-> void:
	pass

func handle_input(event: InputEvent)-> void:
	pass
