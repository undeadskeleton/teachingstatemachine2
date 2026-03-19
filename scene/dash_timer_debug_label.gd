extends Label

@export var dashstate : DashState
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rounded_dash_timer = snapped(dashstate.dash_timer,0.01)
	text = "DashTime: "+ str(rounded_dash_timer)
	pass
