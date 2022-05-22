extends Node2D


export var bullet_damage := 30
export var max_travel := 1000


onready var bullet_startpoint := $bullet_startpoint
onready var bullet_streak = $bullet_container/bullet_streak
onready var streak_animation = $streak_animation



func shoot():
	streak_animation.stop()
	
	var from_point : Vector2 = bullet_startpoint.global_position
	
	var space_state := get_world_2d().direct_space_state
	var ray_target := from_point + Vector2.RIGHT.rotated(rotation) * max_travel
	var result := space_state.intersect_ray(from_point, ray_target, [], 2147483647, true, true)
	
	var to_point := ray_target
	if result:
		to_point = result.position

		var body = result.collider
		if "entity" in body.get_groups():
			body.damage(bullet_damage)
		else:
			body = body.get_parent()
			if "entity" in body.get_groups():
				body.damage(bullet_damage)
	
	bullet_streak.points = PoolVector2Array([from_point, to_point])
	
	streak_animation.play("fade_out")
