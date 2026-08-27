extends GutTest

var house_scene = load("uid://mn8qtvavg7cr")

var hover_color_data = [
	[Player.Faction.INVESTIGATOR, ColorPaletteGlobal.faction_colors["Investigator"]],
	[Player.Faction.CULTIST, ColorPaletteGlobal.faction_colors["Cultist"]],
	[Player.Faction.CREATURE, ColorPaletteGlobal.faction_colors["Creature"]]
]

func test_border_color_by_faction(p = use_parameters(hover_color_data)):
	var faction = p[0]
	var expected_color = p[1]

	var test_house: House = house_scene.instantiate()
	Player.faction= faction

	add_child_autofree(test_house)
	
	var clickable = test_house.get_node("ClickableArea")
	var color_frame = test_house.get_node("HoverFrame")
	
	clickable.mouse_entered.emit()
	test_house._setup_faction_color()
	
	assert_eq(color_frame.border_color, expected_color)

var role_actions_data = [
	[Player.InvestigatorRole.FBI_AGENT, "CHECK_IDENTITY", "SEND_MESSAGE"]
]

func test_actions_by_player_role(p = use_parameters(role_actions_data)):
	# Arrange
	var role = p[0]
	var action_1_display_value = p[1]
	var action_2_display_value = p[2]
	Player.role = role
	var test_house: House = house_scene.instantiate()
	add_child_autofree(test_house)
	var clickable = test_house.get_node("ClickableArea")
	var click_event = InputEventMouseButton.new()
	click_event.button_index = MOUSE_BUTTON_LEFT
	click_event.pressed = true
	# Act
	clickable.mouse_entered.emit()
	clickable.input_event.emit(null, click_event, 0)
	# Assert
	var option_menu = clickable.get_node("Actions")
	var popup: PopupMenu = option_menu.get_popup()
	assert_eq(popup.item_count, 2)
	assert_eq(popup.get_item_text(0), tr(action_1_display_value))
	assert_eq(popup.get_item_text(1), tr(action_2_display_value))
	
