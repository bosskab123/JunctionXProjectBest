extends KinematicBody2D

var speed = 500
var velocity = Vector2()
var status=3
onready var area_detector = $Area2D
onready var player1 = get_node("/root/World/Player1")
onready var player2 = get_node("/root/World/Player2")
onready var score_p1 = get_node("/root/World/score_p1")
onready var score_p2 = get_node("/root/World/score_p2")
func start(pos, dir):
	position = pos + 50*Vector2(dir.x,0) + 50*Vector2(0,dir.y)
	velocity = speed*dir

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	if get_global_position().x == -375:
		queue_free()
	if player1 in area_detector.get_overlapping_bodies():
		player1.score-=1
		score_p1.set_text("Score: %d" %player1.score)
		if not player1.get_node("AnimationPlayer").is_playing():
			player1.get_node("AnimationPlayer").play("Mao")
	if player2 in area_detector.get_overlapping_bodies():
		player2.score-=1
		score_p2.set_text("Score: %d" %player2.score)
		if not player2.get_node("AnimationPlayer").is_playing():
			player2.get_node("AnimationPlayer").play("Mao")
