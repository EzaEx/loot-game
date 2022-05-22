extends Node2D


export var bullet_speed = 1000
export var bullet_damage = 30


var bullet_model := preload("res://Scenes/PhysiGun/Bullet.tscn")

onready var bullet_container := $bullet_container
onready var bullet_spawnpoint := $bullet_spawnpoint


func shoot():
	var new_bullet := bullet_model.instance()
	bullet_container.add_child(new_bullet) 
	
	var new_transform = global_transform.translated(bullet_spawnpoint.position)
	
	new_bullet.impart(new_transform, bullet_speed, bullet_damage)
