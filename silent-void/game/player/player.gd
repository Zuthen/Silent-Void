extends Node

enum Faction {INVESTIGATOR,CULTIST,CREATURE}
enum InvestigatorRole {FBI_AGENT}
var user_name: String
var faction: Faction
var actions: SkillList
var role = InvestigatorRole.FBI_AGENT


func _init():
	actions = _setup_actions_by_role()

func _setup_actions_by_role():
	match faction:
		Faction.INVESTIGATOR:
			var investigator = Investigator.new()
			return investigator.setup_investigator_actions(role)
		Faction.CULTIST:
			pass
		Faction.CREATURE:
			pass


func send_results():
	pass
	
func _sacrify():
	pass

func _infect():
	pass
