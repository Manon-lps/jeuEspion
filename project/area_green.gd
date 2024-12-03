extends Area2D

var is_dragging = false  
var drag_offset = Vector2.ZERO  


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_dragging = true
			drag_offset = global_position - event.global_position
			move_to_front() 
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			is_dragging = false

func _process(delta):
	if is_dragging:
		global_position = get_global_mouse_position() + drag_offset
