extends Node
class_name Investigator


func setup_investigator_actions(role: Player.InvestigatorRole) -> SkillList:
	match role:
		Player.InvestigatorRole.FBI_AGENT:
			return _setup_fbi_agent_actions()
		_:
			return SkillList.new()

func _setup_fbi_agent_actions() -> SkillList:
	var investigator_actions: SkillList = SkillList.new()
	var check_identity: Skill = Skill.new()
	check_identity.action = _check_identity
	check_identity.display_name = tr("CHECK_IDENTITY")
	investigator_actions.skills.append(check_identity)
	
	var send_message: Skill = Skill.new()
	send_message.action = send_results
	send_message.display_name = tr("SEND_MESSAGE")
	investigator_actions.skills.append(send_message)
	return investigator_actions

func _check_identity(house: House):
	var investigator_panel_scene: PackedScene = load("uid://iwhatcdnife4")
	var popup = investigator_panel_scene.instantiate()
	popup.nick = house.user_name
	popup.role = house.player_role
	house.add_child(popup)
	
func send_results(house: House):
	pass
