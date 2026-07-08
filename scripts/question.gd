class_name Question
extends Resource

@export var selected : QuestionList.OPTIONS
@export var correct : QuestionList.OPTIONS

func is_correct() -> bool:
	if selected == correct:
		return true
	return false
