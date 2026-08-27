extends Node2D

@onready var spawn_points = $SpawnPoints
@onready var house_mocks = $HouseMocks
@onready var sky_background = $Background/SkyBackground

var house_scene = preload("uid://mn8qtvavg7cr")

func _ready():
	var house_spawn_points = spawn_points.get_children()
	Player.faction= Player.Faction.INVESTIGATOR
	for i in range (house_spawn_points.size()):
		_spawn_house(house_mocks.houses[i].texture, house_spawn_points[i].global_position,house_mocks.houses[i].user_name, house_mocks.houses[i].role )
	
func _spawn_house(texture: Texture2D, position: Vector2, user_name: String, user_role: String):
		var house: House = house_scene.instantiate()
		house.global_position = position
		house.sprite = texture
		house.user_name = user_name
		house.player_role = user_role
		add_child(house)
	
