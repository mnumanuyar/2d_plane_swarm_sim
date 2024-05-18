extends Node
@onready var control_target = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if control_target.get_meta("stop"):
		return;
		
	var all_planes = get_tree().get_nodes_in_group("planes")
	
	var detected_planes = 0;
	var result_direction = 0;
	for plane in all_planes:
		if detected_planes > 3: continue
		var dist = dist_to(plane)
		
		if dist >  Global.detect_dist: continue
		detected_planes += 1
		
		# if angle to less than PI it is to our right
		var angle_to = control_target.get_angle_to(plane.position)
		var to_right =  (angle_to < PI/2) and (angle_to > - PI/2)
		var direction = 1 if to_right else -1

		# dont get too close
		if dist <  Global.min_dist:
			result_direction -= direction *  Global.min_dist_weight;
		# dont get too far
		if dist >  Global.max_dist:
			result_direction += direction * Global.max_dist_weight;

		# align oriantation

		
	control_target.rotation_direction = result_direction;
		
	
func sort_by_dist(plane1,plane2):
	return dist_to(plane1) < dist_to(plane2) 

func dist_to(plane):
	return control_target.position.distance_to(plane.position)
	
