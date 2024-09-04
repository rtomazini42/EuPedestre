extends Node2D
var lado : bool = true


func _ready() -> void:
	if self.global_position.x > 95:
		lado = false
		#self.position.x -= 3
		$Car1.flip_h = 1
	else:
		lado = true
		$Car1.flip_h = 0
	
func _process(delta):
	if self.lado == false:
		self.position.x -= 3
	if self.lado == true:
		self.position.x += 3
	if self.position.x > 500 or self.position.x < -300:
		self.queue_free()

func paraEsquerda():
	print(self.position)
	
func paraDireita():
	print(self.position)


func _on_rigid_body_2d_body_entered(body):
	print("Replace with function body.")


func _on_car_1_hidden() -> void:
	print("hidde?") # Replace with function body.
