extends KinematicBody2D

var direction = Vector2()
export var distance: int = 100
export var total_ball: int = 20
var ball = preload("res://Ball.tscn")
var speed = 200
export var high_distance =200
var velocity = Vector2()
var score: int = 0
onready var anim = get_node("AnimationPlayer")


func hit_the_ball(dir: Vector2) -> void:
	if Input.is_action_pressed("hit_p2"):
		move_and_slide(direction*high_distance)
	else:
		move_and_slide(direction*distance)
	
func release_ball(dir: Vector2) -> void:
	var b = ball.instance()
	if not anim.is_playing():
		anim.play("Shoot")
	if Input.is_action_pressed("hit_p2"):
		b.start($Pos.get_global_position(),dir*2,2)
	else:
		b.start($Pos.get_global_position(),dir,2)
	get_parent().add_child(b)

func _physics_process(delta):
	direction.y = int(Input.is_action_pressed("rotate_down_p2"))-int(Input.is_action_pressed("rotate_top_p2"))
	direction.x = -int(Input.is_action_pressed("rotate_left_p2"))+int(Input.is_action_pressed("rotate_right_p2"))
	hit_the_ball(direction)
	if(Input.is_action_just_pressed("release_ball_p2")):
		if total_ball and direction!=Vector2(0,0):
			release_ball(direction)
			total_ball -= 1
	direction = Vector2(0,0)

