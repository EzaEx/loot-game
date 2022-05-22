extends KinematicBody2D


export var speed := 20
export var drag := 0.1
export var _dest_threshold := 4

export var max_health := 100

var velocity := Vector2.ZERO
var health := max_health

onready var hp_label = $hp_label

func _ready():
	_update_hp_label()


func _physics_process(delta):
	#apply drag to velocity
	velocity -= drag * velocity
	move_and_slide(velocity)


func damage(damage : int):
	health -= damage
	_update_hp_label()
	
	if health <= 0:
		_die()
	
	
func _update_hp_label():
	hp_label.text = str(health)
	
	
	
func _die():
	queue_free()


func move_direction(dir : Vector2):
	
	dir = dir.normalized()
	#add current move to velocity
	velocity += dir * speed


func navigate_to_position(dest : Vector2) -> bool:
	
	if (global_position - dest).length() < _dest_threshold:
		return true
	
	var dir = dest - global_position
	move_direction(dir)
	return (global_position - dest).length() < _dest_threshold
	
