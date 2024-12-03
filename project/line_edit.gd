extends LineEdit

func _ready() -> void:
	connect("text_changed", Callable(self, "_on_text_changed"))

func _filter_digits(input_text: String) -> String:
	var regex = RegEx.new()
	regex.compile(r"\D")
	return regex.sub(input_text, "")

func _on_text_changed(new_text):
	var regex = RegEx.new()
	regex.compile(r"^\d*$") 
	if not regex.search(new_text):  
		text = _filter_digits(text) 
