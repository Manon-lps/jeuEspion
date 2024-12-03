extends Node2D

var is_dragging = false

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and get_global_mouse_position().distance_to(global_position) < 20:
			is_dragging = true
		elif not event.pressed:
			is_dragging = false
	
func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position()

func _input_event(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Amène ce papier au premier plan
			raise()  # Déplace ce nœud en haut de la pile de rendu
			is_dragging = true
			drag_offset = global_position - event.global_position
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			is_dragging = false
