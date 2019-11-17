extends Node2D
var big_balls = preload("res://big_balls.tscn")
onready var right_door2 = get_node("/root/World/right_door2")
onready var timer = $Timer
var rng = RandomNumberGenerator.new()

func _ready():
	timer.set_wait_time(10)
	timer.connect("timeout",self,"on_Timeout_complete")
	timer.start()
	

func on_Timeout_complete():
	var a = big_balls.instance()
	rng.randomize()
	var r = rng.randi_range(1,2)
	if r==1:
		a.start(right_door2.get_global_position()+Vector2(500,0),Vector2(-1,0))
	else:
		a.start(right_door2.get_global_position()+Vector2(-500,0),Vector2(1,0))
	get_parent().add_child(a)