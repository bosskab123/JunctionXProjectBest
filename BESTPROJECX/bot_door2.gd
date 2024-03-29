extends Area2D
onready var top_door1 = get_node("/root/World/top_door1")
onready var player1 = get_node("/root/World/Player1")
onready var player2 = get_node("/root/World/Player2")
onready var score_p1 = get_node("/root/World/score_p1")
onready var score_p2 = get_node("/root/World/score_p2")
func _on_bot_door2_body_entered(body):
	if body.get_name() == "Player1" or body.get_name() == "Player2":
		body.set_global_position(top_door1.get_global_position()+Vector2(0,50))
		return
	var ball = body
	if ball.status==1:
		ball.set_global_position(top_door1.get_global_position())
		if ball.velocity == 600*ball.velocity.normalized():
			ball.start(ball.get_global_position(), 2*ball.velocity.normalized(),ball.belong)
		else:
			ball.start(ball.get_global_position(), ball.velocity.normalized(),ball.belong)
		ball.status = 0
	else:
		if ball.belong == 1:
			player1.total_ball+=1
		elif ball.belong==2:
			player2.total_ball+=1
		player1.score+=1
		score_p1.set_text("Score: %d" % player1.score)
		ball.queue_free()
