class_name QuestionItem
extends GridContainer

@export var label : String
@export var question : Question
var check_child : CheckContainer
var option_child : OptionButton

func _ready():
	var label_child = Label.new()
	label_child.text = label
	add_child(label_child)
	option_child = OptionButton.new()
	option_child.add_item("A", QuestionList.OPTIONS.A)
	option_child.add_item("B", QuestionList.OPTIONS.B)
	option_child.add_item("C", QuestionList.OPTIONS.C)
	option_child.add_item("D", QuestionList.OPTIONS.D)
	option_child.add_item("E", QuestionList.OPTIONS.E)
	option_child.item_selected.connect(_on_item_selected)
	_on_item_selected()
	add_child(option_child)
	check_child = CheckContainer.new()
	add_child(check_child)
	columns = 3

func _on_item_selected(_idx = 0):
	question.selected = option_child.selected as QuestionList.OPTIONS

func check():
	if is_correct() == true:
		check_child.set_correct()
	elif is_correct() == false:
		check_child.set_wrong()
	else:
		check_child.set_uncheck()

func is_correct() -> bool:
	return question.is_correct()
