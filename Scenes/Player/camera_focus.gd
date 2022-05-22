extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var move_enabled := true
export var toward_mouse := 0.2


func _input(event):
	if event is InputEventMouseMotion and move_enabled:
		self.position = (get_global_mouse_position() - self.global_position) * toward_mouse
