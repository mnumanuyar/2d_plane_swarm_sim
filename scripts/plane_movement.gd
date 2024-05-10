extends CharacterBody2D

var speed = Global.plane_speed # move speed in pixels/sec
var rotation_speed = Global.plane_turn_speed # turning speed in radians/sec
var rotation_direction = 0

@onready var screen_size = get_viewport_rect().size


func _physics_process(delta):
	rotation_direction = clamp(rotation_direction,-1,1)
	if get_meta("controllable"):
		rotation_direction = Input.get_axis("ui_left", "ui_right")
	
	velocity = -transform.y * speed
	rotation += rotation_direction * rotation_speed * delta
	
	global_transform.origin.x = wrapf(global_transform.origin.x, -screen_size.x/2, screen_size.x/2)
	global_transform.origin.y = wrapf(global_transform.origin.y, -screen_size.y/2, screen_size.y/2)
	move_and_slide()
