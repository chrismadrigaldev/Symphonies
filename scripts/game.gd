extends Node2D

var PLAYER_SCENE: PackedScene = load("res://scenes/player.tscn")
var MAX_PLAYERS = Globals.MAX_PLAYERS
var CURRENT_AMOUNT_OF_PLAYERS = Globals.CURRENT_AMOUNT_OF_PLAYERS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while (CURRENT_AMOUNT_OF_PLAYERS < MAX_PLAYERS):
		var player = PLAYER_SCENE.instantiate()
		
		if CURRENT_AMOUNT_OF_PLAYERS == 0:
			player.position = $Map/SpawnPoints/PlayerOneSpawnPoint.position
		else:
			player.position = $Map/SpawnPoints/PlayerTwoSpawnPoint.position
		
		player.PLAYER_NUMBER = CURRENT_AMOUNT_OF_PLAYERS + 1
			
		player.add_to_group("players")
		
		add_child(player)
		
		CURRENT_AMOUNT_OF_PLAYERS += 1
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
