extends KinematicBody2D
class_name Ball

var speed = 300
var velocity = Vector2()
var belong: int
var status: int = 1 # 0 no hit by player, 1 get hit already
onready var player1 = get_node("/root/World/Player1")
onready var player2 = get_node("/root/World/Player2")
func start(pos, dir, own):
	position = pos + 50*Vector2(dir.x,0) + 50*Vector2(0,dir.y)
	velocity = speed*dir
	belong = own

func _physics_process(delta):
	velocity = move_and_slide(velocity)