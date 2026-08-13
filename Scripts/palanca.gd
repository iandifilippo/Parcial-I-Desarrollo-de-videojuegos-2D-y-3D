extends Area2D
@export_file("*.tscn") var siguiente_escena: String = ""
var jugador_cerca = false
var ya_activada = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		jugador_cerca = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		jugador_cerca = false

func _process(delta):
	if jugador_cerca and Input.is_action_pressed("action"):
		if not ya_activada and siguiente_escena != "":
			ya_activada = true
			get_tree().change_scene_to_file(siguiente_escena)
		else:
			print("Palanca activada")
