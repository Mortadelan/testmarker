class_name Question
extends Resource

@export var selected : QuestionList.OPTIONS
@export var correct : QuestionList.OPTIONS
@export var easiness_index : float
@export var discrimination_index : float

func is_correct() -> bool:
	return selected == correct
