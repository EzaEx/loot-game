extends "../Entity/Entity.gd"



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
	
	move_direction(dir)
		
