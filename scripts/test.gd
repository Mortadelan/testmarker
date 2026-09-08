class_name Test
extends Resource

@export var name : String
@export var lists : Array[QuestionList]

func save() -> Dictionary:
	var save_dict = {
		"test_name": name,
		# insert future score formulas here
		"question_list_#": "1",
		"question_list_1": lists[1].save()
		}
	return save_dict

func save_to_file(save_dict: Dictionary):
	pass
