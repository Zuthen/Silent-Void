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
	
func _check_identity(player_data:PlayerData):
	print(player_data.role)
	return player_data.role
	
func send_results(player_data: PlayerData):
	pass
