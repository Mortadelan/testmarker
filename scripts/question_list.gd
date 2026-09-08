class_name QuestionList
extends Resource

enum OPTIONS { A, B, C, D, E }
@export var list : Array[Question] = []

func commit_selected():
	if list.size() > 0:
		for question in list:
			question.correct = question.selected

func save() -> Dictionary:
	var save_dict : Dictionary
	if list.size() > 0:
		for questioni in list.size():
			var question : Dictionary = {
				"correct" : list[questioni].correct,
				"ease" : list[questioni].ease,
				"discrim" : list[questioni].discrim
				}
			save_dict.merge(question)
		return save_dict
	return Dictionary() # empty dict
