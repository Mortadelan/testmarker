class_name QuestionItem
extends GridContainer

@export var label : String

func _ready():
	var label_child = Label.new()
	label_child.text = label
	add_child(label_child)
	var option_child = OptionButton.new()
	option_child.add_item("A", QuestionList.OPTIONS.A)
	option_child.add_item("B", QuestionList.OPTIONS.B)
	option_child.add_item("C", QuestionList.OPTIONS.C)
	option_child.add_item("D", QuestionList.OPTIONS.D)
	option_child.add_item("E", QuestionList.OPTIONS.E)
	add_child(option_child)
