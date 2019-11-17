extends Area2D
onready var player1 = get_node("/root/World/Player1")
onready var player2 = get_node("/root/World/Player2")
onready var score_p1 = get_node("/root/World/score_p1")
onready var score_p2 = get_node("/root/World/score_p2")
func _on_Area_bump_body_entered(body):
	if body.get_name()=="Ball":
		return
	if body is StaticBody2D:
		if body.get_parent().get_parent().get_name()=="Lmid_wall":
			get_parent().velocity.x *=-1
		elif body.get_parent().get_parent().get_name()=="Rmid_wall":
			get_parent().velocity.x *=-1
		elif body.get_parent().get_parent().get_name()=="left_wall":
			get_parent().velocity.x *=-1
		elif body.get_parent().get_parent().get_name()=="right_wall":
			get_parent().velocity.x *=-1
		elif body.get_parent().get_parent().get_name()=="floor_wall":
			get_parent().velocity.y *=-1
		elif body.get_parent().get_parent().get_name()=="ceil_wall":
			get_parent().velocity.y *=-1
		print(body.get_parent().get_parent().get_name())
	elif body.get_name()=="Player1":
		if get_parent().belong==1:
			player1.total_ball+=1
		else:
			player2.total_ball+=1
		if not body.get_node("AnimationPlayer").is_playing():
			body.get_node("AnimationPlayer").play("Hurt")
		player2.score+=1
		score_p2.set_text("Score: %d" % player2.score)
		if player2.score==10:
			get_tree().change_scene("res://Gameend2.tscn")
		get_parent().queue_free()
		
	elif body.get_name()=="Player2":
		if get_parent().belong==1:
			player1.total_ball+=1
		else:
			player2.total_ball+=1
		if not body.get_node("AnimationPlayer").is_playing():
			body.get_node("AnimationPlayer").play("Hurt")
		player1.score+=1
		score_p1.set_text("Score: %d" % player1.score)
		if player1.score==10:
			get_tree().change_scene("res://Gameend.tscn")
		get_parent().queue_free()
		
	
	elif body.get_name()!=get_parent().get_name():
		
		if get_parent().belong==1:
			player1.total_ball+=1
		elif get_parent().belong==2:
			player2.total_ball+=1
		if body.belong==1:
			player1.total_ball+=1
		elif body.belong==2:
			player2.total_ball+=1
		get_parent().queue_free()
		body.queue_free()
		