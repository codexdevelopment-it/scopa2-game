extends Control

@onready var hand_row = $LayoutRoot/HandRow
@onready var table_row = $LayoutRoot/TableRow
@onready var log_label = $LayoutRoot/LogLabel

const SUITS = ["D", "S", "C", "B"]
const RANKS = [1,2,3,4,5,6,7,8,9,10]
const Card = preload("res://scripts/models/Card.gd")

var deck : Array[Card] = []
var table_cards : Array[Card] = []
func _create_full_deck() -> Array[Card]:
	var deck: Array[Card] = []
	var next_id: int = 0
	for suit in SUITS:
		for rank in RANKS:
			var card := Card.new(next_id, rank, suit)
			deck.append(card)
			next_id += 1
	deck.shuffle()	
	return deck
	
func _render_table() -> void:
	for child in table_row.get_children():
		child.queue_free()
		
	for card in table_cards:
		var btn := Button.new()
		btn.text = card._to_string()
		table_row.add_child(btn)
		
		
func _init_mock_game_state() -> void:
	deck = _create_full_deck()
	table_cards.clear()
	
	for i in 4:
		var card = deck.pop_back()
		table_cards.append(card)
		
	_render_table()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_mock_game_state()
	log_label.text = "Gioco Avviato"

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
