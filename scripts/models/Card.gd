class_name Card
extends Resource

@export var id: int
@export var rank: int
@export var suit: String

func _init(_id: int, _rank: int, _suit: String):
	id = _id
	rank = _rank
	suit = _suit


func _to_string() -> String:
	return "%d di %s" % [rank, suit]
