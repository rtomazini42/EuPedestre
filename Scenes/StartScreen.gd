extends Node2D



func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		#print("clicado")
		# Carrega a nova cena
		#var new_scene = preload("res://Scenes/Gameplay.tscn").instantiate()
		get_tree().change_scene_to_file("res://Scenes/Gameplay.tscn")
		# Muda para a nova cena
		
		#get_tree().root.add_child(new_scene)
