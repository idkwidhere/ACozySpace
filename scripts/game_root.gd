extends Node

#REFERENCES
@onready var player_menu = $UI/player_menu
@onready var terminal_menu = $UI/terminal_menu
@onready var shipping_menu = $UI/shipping_menu
@onready var player = $Player


#playermenu vars
var player_menu_open = false
var terminal_menu_open = false
var shipping_menu_open = false
var interact_type

# Called when the node enters the scene tree for the first time.
func _ready():
	#signal connects
	Signals.connect("toggle_player_menu", toggle_player_menu)
	Signals.connect("player_interact", interact)
	
	player_menu.set_player_inventory_data(player.inventory)
	
	for node in get_tree().get_nodes_in_group("seedbox_inventory"):
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if terminal_menu_open == false:
		terminal_menu.visible = false

func interact(type):
	if type == "terminal":
		terminal_menu_open = !terminal_menu_open
		terminal_menu.visible = !terminal_menu.visible


	if type == "shipping_box":
		shipping_menu_open = !shipping_menu_open
		shipping_menu.visible = !shipping_menu.visible
	
	if type == null:
		terminal_menu.visible = false
		terminal_menu_open = false
		shipping_menu.visible = false
		shipping_menu_open = false


func toggle_player_menu():
	if player_menu_open == false:
		player_menu.visible = true
		player_menu_open = true
	else:
		player_menu.visible = false
		player_menu_open = !player_menu_open
