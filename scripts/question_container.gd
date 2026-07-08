class_name QuestionContainer
extends GridContainer

@export var questions : QuestionList
func _ready():
	for questioni in questions.list.size():
		var question := QuestionItem.new()
		question.label = "Question " + str(questioni + 1)
		question.question = questions.list[questioni]
		add_child(question)

func _on_button_pressed():
	for child in get_children():
		child.check()
