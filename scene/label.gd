extends Label

@export var statemachine : StateMachine
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = statemachine.get_current_state()+" direction:"+str(statemachine.lastdir)
	pass
