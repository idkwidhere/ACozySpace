extends StaticBody2D

var mission_list = []
var missions_available = 1

#missions container
@onready var missions = $Missions

# Called when the node enters the scene tree for the first time.
func _ready():
	gen_missions()
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_interact_area_body_entered(body):
	if body is Player:
		$Interact.visible = true


func _on_interact_area_body_exited(body):
	if body is Player:
		$Interact.visible = false

func _is_terminal():
	pass

func gen_missions():
	for n in missions_available:
		var mission = Mission.new()
		mission.mission_title = mission.mission_titles[randi_range(0, len(mission.mission_titles) - 1)]
		mission_list.append(mission)
		print("genned mission")
		print(mission_list[0].mission_title)
		
		 
