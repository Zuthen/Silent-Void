extends Sprite2D

var day: bool = false

func _ready():
	_set_time_of_day()

func change_time_of_day():
	day = !day
	texture.gradient.reverse()

func _set_time_of_day():
	if day:
		texture.gradient.reverse()
