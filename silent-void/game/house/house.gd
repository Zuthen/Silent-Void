extends Sprite2D
class_name  House

var sprite: Texture2D
var user_name: String

@onready var house: Sprite2D = $"."
@onready var hover_frame = $HoverFrame
@onready var clickable_area = $ClickableArea
@onready var label = $Label


func _ready() -> void:
	house.texture = sprite
	label.text = user_name
	clickable_area.mouse_entered.connect(_on_mouse_entered)
	clickable_area.mouse_exited.connect(_on_mouse_exited)
	hover_frame.visible = false


func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	hover_frame.visible = true


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	hover_frame.visible = false
