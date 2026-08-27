extends Sprite2D
class_name  House

var sprite: Texture2D
var user_name: String
var player_role:String
var player_data: PlayerData

@onready var house: Sprite2D = $"."
@onready var hover_frame = $HoverFrame
@onready var clickable_area = $ClickableArea
@onready var label = $Label
@onready var actions: MenuButton = $ClickableArea/Actions





func _ready() -> void:
	player_data = PlayerData.setup_citizen_data(player_role)
	_setup_faction_color()
	house.texture = sprite
	label.text = user_name
	clickable_area.mouse_entered.connect(_on_mouse_entered)
	clickable_area.mouse_exited.connect(_on_mouse_exited)
	hover_frame.visible = false
	var action_list: PopupMenu = actions.get_popup()
	action_list.id_pressed.connect(_on_action_pressed.bind(player_data))
	for i in range(Player.actions.skills.size()):
		var action = Player.actions.skills[i]
		action_list.add_item(action.display_name, i)

func _on_action_pressed(idx: int, player_data: PlayerData):
	var skill_to_run = Player.actions.skills[idx].action
	skill_to_run.call(player_data)


func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	hover_frame.visible = true


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	hover_frame.visible = false
	
func _setup_faction_color():
	match Player.faction:
		Player.Faction.CREATURE:
			hover_frame.border_color = ColorPaletteGlobal.faction_colors["Creature"]
		Player.Faction.INVESTIGATOR:
			hover_frame.border_color = ColorPaletteGlobal.faction_colors["Investigator"]
		Player.Faction.CULTIST:
			hover_frame.border_color = ColorPaletteGlobal.faction_colors["Cultist"]
