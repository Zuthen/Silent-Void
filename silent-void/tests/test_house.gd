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
	
func test_spawn():
	# Arrange
	var data =  autofree(HouseMockData.new())
	data._ready()
	var  test_data = data.houses.pick_random()
	# Act
	var test_house: House = house_scene.instantiate()
	test_house.user_name = test_data.user_name
	test_house.sprite = test_data.texture
	add_child_autofree(test_house)
	# Assert
	assert_eq(test_house.label.text, test_data.user_name)
	assert_eq(test_house.sprite, test_data.texture)
	
	#Cleanup
	data.queue_free()
	
