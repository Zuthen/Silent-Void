extends Control

var nick: String
var role: String

@onready var rich_text_label = $PopupPanel/RichTextLabel

func _ready():
	rich_text_label.text = tr("ROLE_REVEAL").format({"nick": nick, "role":role})


func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_pos = make_input_local(event).position
		if not Rect2(Vector2.ZERO, size).has_point(local_pos):
			hide() 
