extends Node2D

var cursor = preload("res://PNG/Extra/Default/cursor_b.png")
var highlight_color = Color(1, 0.8, 0.2)
@onready var ecran = $FondEcran/AreaPC/Polygon2D 
@onready var carnet = $FondEcran/AreaCarnet/Polygon2D 
@onready var cafe = $FondEcran/AreaCafe/Polygon2D
@onready var livre = $FondEcran/AreaLivres/Polygon2D
@onready var livreimg = $FondEcran/AreaLivres/Livreimg
@onready var croix = $FondEcran/AreaLivres/croix
@onready var papers = $FondEcran/AreaPaper/Polygon2D
@onready var horloge = $FondEcran/AreaHorloge/Polygon2D
@onready var notebook = $FondEcran/SpriteNB


@onready var papers_scene = preload("res://paper.tscn") 
@onready var croix_papier = $FondEcran/AreaCroixPapier
var papers_instance = null
var spawn_offset = Vector2(30, 30) 
var next_paper_position = Vector2(200, 200)
var paperstab = []


@export var locked_screen_scene_path: String = "res://ecran_verouille.tscn"

func _ready() -> void:
	pass
	

func change_cursor():
	Input.set_custom_mouse_cursor(cursor)

func change_cursor_back():
	Input.set_custom_mouse_cursor(null)

func _on_area_pc_mouse_entered() -> void:
	ecran.visible = true
	change_cursor()

func _on_area_pc_mouse_exited() -> void:
	ecran.visible = false
	change_cursor_back()


func _on_area_carnet_mouse_entered() -> void:
	carnet.visible = true
	change_cursor()


func _on_area_carnet_mouse_exited() -> void:
	carnet.visible = false
	change_cursor_back()


func _on_area_cafe_mouse_entered() -> void:
	cafe.visible = true
	change_cursor()


func _on_area_cafe_mouse_exited() -> void:
	cafe.visible = false
	change_cursor_back()
	



func _on_area_cafe_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/main.dialogue"), "start")
		return




func _on_area_livres_mouse_entered() -> void:
	livre.visible = true
	change_cursor()
	

func _on_area_livres_mouse_exited() -> void:
	livre.visible = false
	change_cursor_back()
	


func _on_area_livres_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		livreimg.visible = true
		croix.visible = true


func _on_area_croix_mouse_entered() -> void:
	change_cursor()

func _on_area_croix_mouse_exited() -> void:
	change_cursor_back()


func _on_area_croix_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		livreimg.visible = false
		croix.visible = false

func spawn_papers():
	
	var paper_instance = papers_scene.instantiate()
	add_child(paper_instance)
	paper_instance.global_position = next_paper_position
	paperstab.append(paper_instance) 
	
	next_paper_position += spawn_offset


func hide_papers():
	for paper in paperstab:
		paper.queue_free() 
		paperstab.clear()



func _on_area_paper_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if papers_instance == null:
			spawn_papers()
			croix_papier.visible = true


func _on_area_paper_mouse_entered() -> void:
	papers.visible = true
	change_cursor()


func _on_area_paper_mouse_exited() -> void:
	papers.visible = false
	change_cursor_back()


func _on_area_croix_papier_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		hide_papers()
		croix_papier.visible = false
		


func _on_area_croix_papier_mouse_entered() -> void:
	change_cursor()


func _on_area_croix_papier_mouse_exited() -> void:
	change_cursor_back()


func _on_area_horloge_mouse_entered() -> void:
	change_cursor()
	horloge.visible = true


func _on_area_horloge_mouse_exited() -> void:
	change_cursor_back()
	horloge.visible = false


func _on_area_horloge_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		DialogueManager.show_dialogue_balloon(load("res://dialogues/dialogue.dialogue"), "start")
		return


func _on_area_carnet_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		notebook.visible = true


func _on_area_croix_carnet_mouse_entered() -> void:
	change_cursor()


func _on_area_croix_carnet_mouse_exited() -> void:
	change_cursor_back()


func _on_area_croix_carnet_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		notebook.visible = false


func _on_area_pc_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		load_locked_screen()

func load_locked_screen():
	var locked_screen_scene = load(locked_screen_scene_path).instantiate()
	get_tree().root.add_child(locked_screen_scene)
	self.visible = false
