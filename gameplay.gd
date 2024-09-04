extends Node2D

var tempo_acumulado = 0.0

func _process(delta):
	# Acumula o tempo passado
	tempo_acumulado += delta

	# Gera carros a cada 1 segundo
	if tempo_acumulado >= 0.2:
		# Reseta o tempo acumulado
		tempo_acumulado = 0.0

		# Carrega a cena do carro
		var personagem_scene = preload("res://Carros/Carro1.tscn")

		# Acessa os Path2D
		var path_esquerdo = $Path2DEsquerdo
		var path_direito = $Path2D2Direito

		if path_esquerdo == null:
			print("Path2DEsquerdo não encontrado")
		if path_direito == null:
			print("Path2DDireito não encontrado")

		# Cria PathFollow2D para seguir o Path2DEsquerdo
		var path_follow_esquerdo = PathFollow2D.new()
		path_esquerdo.add_child(path_follow_esquerdo)
		path_follow_esquerdo.progress_ratio = randf_range(0.0, 1.0)

		# Cria PathFollow2D para seguir o Path2DDireito
		var path_follow_direito = PathFollow2D.new()
		path_direito.add_child(path_follow_direito)
		path_follow_direito.progress_ratio = randf_range(0.0, 1.0)

		# Instancia e posiciona o carro no Path2D esquerdo
		var personagem1 = personagem_scene.instantiate()
		personagem1.position = path_follow_esquerdo.position
		add_child(personagem1)

		# Instancia e posiciona o carro no Path2D direito
		var personagem2 = personagem_scene.instantiate()
		personagem2.position = path_follow_direito.position
		add_child(personagem2)

func _ready():
	pass




func _on_timer_mensagem_timeout() -> void:
	get_tree().reload_current_scene() 


func _on_timer_mensagem_2_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/StartScreen.tscn")
