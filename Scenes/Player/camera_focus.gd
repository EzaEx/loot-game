extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var toward_mouse = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = (get_global_mouse_position() - self.global_position) * toward_mouse
