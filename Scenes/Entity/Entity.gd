extends KinematicBody2D


export var speed := 20
export var drag := 0.1

var velocity := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func move_direction(dir : Vector2):
	
	dir = dir.normalized()
	
	#add current move to velocity
	velocity += dir * speed
	#apply drag to velocity
	velocity -= drag * velocity
	
	move_and_slide(velocity)
