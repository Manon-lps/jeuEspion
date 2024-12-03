extends Panel

const PASSWORD = "891289345711"

@export var unlocked_scene_path: String = "res://ecranDeverouille.tscn"
@export var room_path: String = "res://node_2d.tscn"

@onready var line_edit = $LineEdit
@onready var submit_button = $Button
@onready var back_button = $BackButton

func _ready() -> void:
	submit_button.connect("pressed", Callable(self, "_on_submit_pressed"))
	back_button.connect("pressed", Callable(self, "_on_back_pressed"))

func _on_back_pressed():
	var room = load(room_path).instantiate()
	get_tree().root.add_child(room)
	queue_free()


func _on_submit_pressed():
	if line_edit.text == PASSWORD:
		var unlocked_scene = load(unlocked_scene_path).instantiate()
		get_tree().root.add_child(unlocked_scene)
		queue_free()  
	else:
		line_edit.text = ""
		line_edit.placeholder_text = "Incorrect"
