class_name Question
extends Resource

@export var selected : QuestionList.OPTIONS
@export var correct : QuestionList.OPTIONS

func is_correct() -> bool:
	return selected == correct
