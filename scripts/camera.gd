extends Camera2D

@onready var stage_sprite = $"../Map/Stage/StageSprite"
@onready var stage_body = $"../Map/Stage"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var stage_size = stage_sprite.texture.get_size() * stage_body.scale
	
	limit_left = -stage_size.x * 0.5
	limit_right = stage_size.x * 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var players_in_level = get_tree().get_nodes_in_group("players")
	
	if players_in_level.size() < 2:
		return
	
	var player_collider = players_in_level[0].get_node_or_null("PlayerCollider")
	if player_collider == null:
		return

	var player_buffer = player_collider.shape.size.x * 2
	var screen_left = global_position.x - (Globals.WINDOW_WIDTH * 0.5) + player_buffer
	var screen_right = global_position.x + (Globals.WINDOW_WIDTH * 0.5) - player_buffer

	for player in players_in_level:
		player.global_position.x = clamp(player.global_position.x, screen_left, screen_right)
		
	global_position.x = (players_in_level[0].position.x + players_in_level[1].position.x) * 0.5
