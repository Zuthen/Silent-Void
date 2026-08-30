extends Control

var nick: String
var role: String

@onready var rich_text_label = $PopupPanel/RichTextLabel

func _ready():
	var research_result: String = tr("ROLE_REVEAL").format({"nick": nick, "role":role})
	rich_text_label.text = research_result
	GlobalSignals.add_to_journal.emit(research_result.strip_escapes())
	

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var local_pos = make_input_local(event).position
		if not Rect2(Vector2.ZERO, size).has_point(local_pos):
			hide() 
