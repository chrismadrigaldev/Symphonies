extends CharacterBody2D

var PLAYER_NUMBER: int
var PLAYER_INPUTS: Dictionary

var GRAVITY = Globals.GRAVITY

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _ready() -> void:
	PLAYER_INPUTS = InputConfig.PLAYER_INPUTS[PLAYER_NUMBER]
	if PLAYER_NUMBER == 2:
		$PlayerSprite.flip_h = true
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(PLAYER_INPUTS["left"], PLAYER_INPUTS["right"])
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
