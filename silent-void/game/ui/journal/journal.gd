extends ScrollContainer
@onready var history = $History

var journal_entry_scene: PackedScene = preload("uid://cpfdum73gluyf")

signal entry_added()

func _ready():
	GlobalSignals.add_to_journal.connect(_add_to_journal)
	
func _add_to_journal(text):
	print("Adding to journal ",text)
	var journal_entry = journal_entry_scene.instantiate()
	journal_entry.entry_text = text
	history.add_child(journal_entry)
	history.move_child(journal_entry,0)
	await get_tree().process_frame
	scroll_vertical = 0
	entry_added.emit()
	
