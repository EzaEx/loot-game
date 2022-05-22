extends Node2D


export var ttl := 5.0

var speed := 0
var damage := 0
var destroyed := false


func impart(in_global_transform : Transform2D, in_speed : int, in_damage : int):
	global_transform = in_global_transform
	speed = in_speed
	damage = in_damage


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ttl -= delta
	if ttl < 0:
		queue_free()
	
	position += Vector2.RIGHT.rotated(rotation) * speed * delta




func _on_hitbox_body_entered(body):
	if "entity" in body.get_groups() and not destroyed:
		body.damage(damage)
	
	queue_free()
	destroyed = true


func _on_hitbox_area_entered(area):
	var body = area.get_parent()
	
	if "entity" in body.get_groups() and not destroyed:
		body.damage(damage)
		queue_free()
		destroyed = true
