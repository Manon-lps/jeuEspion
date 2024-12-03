extends Sprite2D

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
