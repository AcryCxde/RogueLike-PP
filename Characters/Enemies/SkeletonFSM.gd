extends FiniteStateMachine


func _init() -> void:
	_add_state("idle")
	_add_state("chase")


func _ready() -> void:
	set_state(states.chase)

func _state_logic(_delta: float) -> void:
	if state == states.chase:
		parent.chase()
		parent.move()

func _get_transition() -> int:
	match state:
		states.idle:
			if parent.velocity.length() > 5:
				return states.chase
		states.chase:
			if parent.velocity.length() < 5:
				return states.idle
	return -1


func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.idle:
			animation_player.play("idle")
		states.chase:
			animation_player.play("chase")
