extends Node2D

@onready var spawn_points = $SpawnPoints
@onready var house_mocks = $HouseMocks
var house_scene = preload("uid://mn8qtvavg7cr")

func _ready():
	var house_spawn_points = spawn_points.get_children()
	print(house_spawn_points)
	for i in range (house_spawn_points.size()):
		_spawn_house(house_mocks.houses[i].texture, house_mocks.houses[i].user_name, house_spawn_points[i].global_position)

func _spawn_house(texture: Texture2D, user_name: String, position: Vector2):
		var house: House = house_scene.instantiate()
		house.global_position = position
		house.sprite = texture
		house.user_name = user_name
		add_child(house)
	
