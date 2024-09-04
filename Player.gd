extends Sprite2D

@export var cooldownPasso : float = 0.3

var cooldown : float = 0.0
var ferido : bool = false
func _process(delta):
	if ferido == false:
		if InputEvent:
			if cooldown > cooldownPasso:
				if Input.is_key_pressed(KEY_W):
						self.position.y -= 5
						cooldown = 0.0
				if Input.is_key_pressed(KEY_S):
						self.position.y += 5
						cooldown = 0.0
			if Input.is_key_pressed(KEY_D):
				self.position.x += 2
			if Input.is_key_pressed(KEY_A):
				self.position.x -= 2
		cooldown += delta

func _ready():
	# Conecte o sinal de colisão da Area2D
	ferido = false
	$Area2D.connect("area_entered", Callable(self, "_on_area_entered"))

func _on_area_entered(area):
	if area.name == 'CarroArea':
		
		%Label.visible = true
		%TimerMensagem.start()
		%Ferido.visible = true
		%Music.playing = false
		%Scream.play()
		ferido = true
	if area.name == 'SolArea':
		print("WinGame")
	
