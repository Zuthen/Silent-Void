extends Node
class_name HouseMockData
@export var houses: Array[HouseData] = []

func _ready():
	var house_1 = HouseData.new()
	house_1.user_name = "Koń szczerbaty"
	house_1.texture = load("uid://orf6qmg8g2xf")
	
	var house_2 = HouseData.new()
	house_2.user_name ="Pies Kudłaty"
	house_2.texture=load("uid://orf6qmg8g2xf")
	
	var house_3 = HouseData.new()
	house_3.user_name = "Wściekła kocica"
	house_3.texture = load("uid://bf8dnvcsvubdd")
	
	var house_4 = HouseData.new()
	house_4.user_name="Halyna ze Młyna"
	house_4.texture=load("uid://bjrssm74viaqe")
	
	var house_5 = HouseData.new()
	house_5.user_name = "Ciołek"
	house_5.texture = load("uid://3swjsmkhx5tm")
	
	houses.append_array([house_1, house_2, house_3,house_4,house_5])
