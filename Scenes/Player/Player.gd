extends "../Entity/Entity.gd"

onready var gun = $Gun

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var dir := Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		dir += Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		dir += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		dir += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		dir += Vector2(1, 0)
		
	dir = dir.normalized()
	
	if dir != Vector2.ZERO:
		move_direction(dir)
	
	
func _input(event):
	
	if event.is_action_pressed("shoot"):
		gun.shoot()
	
	if event is InputEventMouseMotion:
		 gun.rotation = (get_global_mouse_position() - self.global_position).angle()
		
