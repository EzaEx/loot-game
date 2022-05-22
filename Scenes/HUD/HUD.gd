extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var fps_label := $fps_label
onready var cursor = $cursor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	fps_label.text = "FPS: " + str(Engine.get_frames_per_second())
	
	cursor.rect_position = get_viewport().get_mouse_position() - (cursor.rect_size * cursor.rect_scale) / 2
