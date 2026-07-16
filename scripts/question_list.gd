class_name QuestionList
extends Resource

enum OPTIONS { A, B, C, D, E }
@export var list : Array[Question] = []

func commit_selected():
	if list.size() > 0:
		for question in list:
			question.correct = question.selected
