class_name QuestionList
extends Resource

enum OPTIONS { A, B, C, D, E }
@export var list : Array[Question] = []

func is_list_correct() -> Variant:
	var wrong_arr : Array[Question]
	for question in list:
		if question.is_correct() != true:
			wrong_arr.append(question)
	if wrong_arr.size() > 0:
		return wrong_arr
	return true
