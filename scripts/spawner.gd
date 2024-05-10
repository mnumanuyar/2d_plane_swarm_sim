extends Node

var plane = preload("res://scenes/plane.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(-10,10,1):
		for y in range(-10,10,1):
			var instance =plane.instantiate()
			instance.global_transform.origin.x = x*30
			instance.global_transform.origin.y = y*30
			add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
