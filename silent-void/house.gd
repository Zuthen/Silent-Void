extends Sprite2D

var sprite: Texture2D = load("uid://7pfwa8rnfskv")
@onready var house: Sprite2D = $"."
@onready var area_2d: Area2D = $Area2D
@onready var actions: MenuButton = $Area2D/Actions


func _ready() -> void:
	house.texture=sprite
	area_2d.mouse_entered.connect(_show_actions)
	area_2d.mouse_exited.connect(_hide_actions)

func _show_actions():
	print("mouse hover")
	actions.visible = true

func _hide_actions():
	print("outside")
	actions.visible = false
