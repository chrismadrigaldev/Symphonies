extends Node

# Window
var WINDOW_SIZE: Vector2
var WINDOW_WIDTH: float
var WINDOW_HEIGHT: float

# Constants
const MAX_PLAYERS: int = 2
var CURRENT_AMOUNT_OF_PLAYERS: int = 0

# Physics
const GRAVITY: float = 2200.0
const FRICTION: float = 800.0

# Combat
const HITSTUN_FRAMES: int = 12
const BLOCKSTUN_FRAMES: int = 8
const KNOCKBACK_FORCE: float = 300.0

# Match Rules
const ROUND_TIMER: int = 99
const MAX_ROUNDS: int = 3
const MAX_HEALTH: int = 1000

func _ready():
	WINDOW_SIZE = get_viewport().get_visible_rect().size
	WINDOW_WIDTH = WINDOW_SIZE.x
	WINDOW_HEIGHT = WINDOW_SIZE.y
