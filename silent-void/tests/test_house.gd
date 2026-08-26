extends GutTest

var house_scene = load("uid://mn8qtvavg7cr")

func test_border_not_visible_on_start():
	# Arrange
	var test_house = house_scene.instantiate()
	add_child_autofree(test_house)
	var color_frame = test_house.get_node("HoverFrame")
	
	#Assert
	assert_false(color_frame.visible)

func test_border_visible_on_hover():
	# Arrange
	var test_house = house_scene.instantiate()
	add_child_autofree(test_house)
	var clickable = test_house.get_node("ClickableArea")
	var color_frame = test_house.get_node("HoverFrame")
	# Act
	clickable.mouse_entered.emit()
	# Assert
	assert_true(color_frame.visible)
	
func test_border_hides_after_unhover():
	# Arrange
	var test_house = house_scene.instantiate()
	add_child_autofree(test_house)
	var clickable = test_house.get_node("ClickableArea")
	var color_frame = test_house.get_node("HoverFrame")
	# Act
	clickable.mouse_entered.emit()
	clickable.mouse_exited.emit()
	# Assert
	assert_false(color_frame.visible)
	
func test_action_menu_visible_on_click():
	# Arrange
	var test_house = house_scene.instantiate()
	add_child_autofree(test_house)
	var clickable = test_house.get_node("ClickableArea")
	var actions = test_house.get_node("ClickableArea/Actions")
	var click_event = InputEventMouseButton.new()
	click_event.button_index = MOUSE_BUTTON_LEFT
	click_event.pressed = true
	# Act
	clickable.mouse_entered.emit()
	clickable.input_event.emit(null, click_event, 0)
	# Assert
	assert_true(actions.visible)
	
	
