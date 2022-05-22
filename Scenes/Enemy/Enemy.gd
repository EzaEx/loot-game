extends "../Entity/Entity.gd"


onready var target_pos = global_position


func _process(delta):
	navigate_to_position(target_pos)
	

func _input(event):
	
	if event.is_action_pressed("alternate"):
		target_pos = get_global_mouse_position()
