extends Resource
class_name PlayerData

var role: String

static func setup_citizen_data(role:String) -> PlayerData:
	var citizen = PlayerData.new()
	citizen.role = role
	return citizen
	
