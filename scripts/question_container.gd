class_name QuestionContainer
extends GridContainer

@export var questions : QuestionList
@onready var checkmark_uncheck = $"../checkmark_uncheck"
@onready var checkmark_correct = $"../checkmark_correct"
@onready var checkmark_wrong = $"../checkmark_wrong"

func _ready():
	for questioni in questions.list.size():
		var question := QuestionItem.new()
		question.label = "Question " + str(questioni + 1)
		question.columns = 2
		add_child(question)

func _on_button_pressed():
	if questions.is_list_correct() != true:
		handle_wrongs(questions.is_list_correct())
		checkmark_wrong.set_visible(true)
		checkmark_correct.set_visible(false)
	elif questions.is_list_correct() == true:
		checkmark_correct.set_visible(true)
		checkmark_wrong.set_visible(false)

func handle_wrongs(wrong_array : Array[Question]):
	pass
