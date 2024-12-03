extends Node2D

var cursor = preload("res://PNG/Extra/Default/cursor_b.png")
@onready var documents = $MesDocuments/FenetreDoc
@onready var flag = $MesDocuments/Flag
@onready var flaglabel = $MesDocuments/flag_txt
@onready var imgtxt = $MesDocuments/fichierTxt
@onready var menudem = $Bureau/MenuDemarrer

func change_cursor():
	Input.set_custom_mouse_cursor(cursor)

func change_cursor_back():
	Input.set_custom_mouse_cursor(null)

func _on_area_doc_mouse_entered() -> void:
	change_cursor()

func _on_area_doc_mouse_exited() -> void:
	change_cursor_back()
	


func _on_area_doc_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		documents.visible = true
		flaglabel.visible = true
		imgtxt.visible = true


func _on_area_txt_mouse_entered() -> void:
	change_cursor()


func _on_area_txt_mouse_exited() -> void:
	change_cursor_back()


func _on_area_txt_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		flag.visible = true
	
		


func _on_area_demarrer_mouse_entered() -> void:
	change_cursor()


func _on_area_demarrer_mouse_exited() -> void:
	change_cursor_back()


func _on_area_demarrer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		menudem.visible = true
