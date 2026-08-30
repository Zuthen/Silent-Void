extends GutTest

var journal_scene: PackedScene = preload("uid://cdj164ipli6sb")

func test_journal_entry_added():
	# Arrange
	var test_journal = journal_scene.instantiate()
	add_child_autoqfree(test_journal)
	
	var test_message: String = "Ja sem Kogucik kochający banany"
	
	# Act
	GlobalSignals.add_to_journal.emit(test_message)
	await wait_for_signal(test_journal.entry_added, 2.0)
	
	# Assert
	var entry = test_journal.get_node("History/JournalEntry") 
	assert_eq(entry.entry_text, test_message)
