extends CharacterBody2D

var speed = Global.plane_speed  # move speed in pixels/sec
var rotation_speed = Global.plane_turn_speed  # turning speed in radians/sec
var rotation_direction = 0

func _physics_process(delta):
	rotation_direction = clamp(rotation_direction,1,-1)
	if get_meta("controllable"):
		rotation_direction = Input.get_axis("ui_left", "ui_right")	
	
	velocity = -transform.y * speed
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
