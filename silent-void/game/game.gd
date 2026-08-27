extends Node2D

@onready var spawn_points = $SpawnPoints
@onready var house_mocks = $HouseMocks
@onready var player = $Player
@onready var sky_background = $Background/SkyBackground

var house_scene = preload("uid://mn8qtvavg7cr")

func _ready():
	var house_spawn_points = spawn_points.get_children()
	player.faction= player.Faction.CULTIST
	for i in range (house_spawn_points.size()):
		_spawn_house(house_mocks.houses[i].texture, 
		house_mocks.houses[i].user_name, 
		house_spawn_points[i].global_position,
		player.faction)
	
func _spawn_house(texture: Texture2D,
 user_name: String, 
position: Vector2, 
player_faction: Player.Faction):
		var house: House = house_scene.instantiate()
		house.global_position = position
		house.sprite = texture
		house.user_name = user_name
		house.user_faction = player_faction
		add_child(house)
	
