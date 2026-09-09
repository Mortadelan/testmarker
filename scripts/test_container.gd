class_name TestContainer
extends Label

@export var test : Test

var slider : HSlider
var save_button : Button
var set_button : Button
var check_button : Button
var questions : QuestionContainer

func _ready():
	if test != null:
		self.label_settings = load("res://scripts/label_settings.tres")

		questions = QuestionContainer.new()
		questions.questions = test.lists[0]
		questions.anchor_top = 0.25
		questions.anchor_bottom = 0.25
		questions.offset_right = 40
		questions.offset_bottom = 40
		questions.position = Vector2(0, 30)
		questions.size_flags_horizontal = SizeFlags.SIZE_EXPAND_FILL
		add_child(questions)
		# all the tedious setup of:
		# the size slider
		#  - connect value_changed() signal to correct test.lists[i]._on_h_slider_value_changed()
		slider = HSlider.new()
		slider.tick_count = 5
		slider.ticks_on_borders = true
		slider.min_value = 1.0
		slider.max_value = 5.0
		slider.value_changed.connect(questions._on_h_slider_value_changed)
		questions._on_h_slider_value_changed(5)
		slider.value = 5.0
		slider.anchor_left = 0.5
		slider.anchor_right = 0.5
		slider.offset_left = -44
		slider.offset_top = 10
		slider.offset_right = 56
		slider.offset_bottom = 26
		# the save_button
		#  - connect pressed() signal to correct test.lists[i]._on_save_button_pressed()
		save_button = Button.new()
		save_button.text = "Save"
		save_button.anchor_left = 1.0
		save_button.anchor_right = 1.0
		save_button.offset_top = 5
		save_button.offset_right = -98
		save_button.offset_bottom = 5
		save_button.grow_horizontal = GrowDirection.GROW_DIRECTION_BEGIN
		save_button.pressed.connect(self._on_save_button_pressed)
		# the set_button
		#  - connect pressed() signal to correct test.lists[i]._on_set_button_pressed()
		set_button = Button.new()
		set_button.text = "Set"
		set_button.anchor_left = 1.0
		set_button.anchor_right = 1.0
		set_button.offset_top = 5
		set_button.offset_right = -60
		set_button.offset_bottom = 5
		set_button.grow_horizontal = GrowDirection.GROW_DIRECTION_BEGIN
		set_button.pressed.connect(questions._on_set_button_pressed)
		# the check_button
		#  - connect pressed() signal to correct test.lists[i]._on_check_button_pressed()
		check_button = Button.new()
		check_button.text = "Check"
		check_button.anchor_left = 1.0
		check_button.anchor_right = 1.0
		check_button.offset_top = 5
		check_button.offset_right = 0
		check_button.offset_bottom = 5
		check_button.grow_horizontal = GrowDirection.GROW_DIRECTION_BEGIN
		check_button.pressed.connect(questions._on_check_button_pressed)
		# then correctly populate children with:
		# slider
		# buttons
		# test.lists[i] : QuestionList
		self.text = test.name
		add_child(slider)
		add_child(save_button)
		add_child(set_button)
		add_child(check_button)
	else:
		test = load("res://tests/testmaker/blank.tres")
		_ready()

func _on_save_button_pressed():
	var file_dialog = FileDialog.new()
	file_dialog.file_mode = FileDialog.FileMode.FILE_MODE_SAVE_FILE
	# file_dialog.current_dir = test_dir.?
	# maybe we make some sort of TestDir global, so that all open tests
	# and test directories are easily accessible once they're opened
	file_dialog.access = FileDialog.Access.ACCESS_FILESYSTEM
	var filter := "*.json, *.tres, *.test"
	var description := "Test file"
	var mime_type := "application/json, application/x-godot-resource"
	file_dialog.add_filter(filter, description, mime_type)
	add_child(file_dialog)
	file_dialog.file_selected.connect(_on_file_selected)
	file_dialog.get_cancel_button().pressed.connect(_on_cancelled)
	file_dialog.popup_file_dialog()

func _on_cancelled():
	print("Cancelled")
	free_dialogs()

func _on_file_selected(path: String):
	var file = FileAccess.open(path, FileAccess.WRITE)
	var save_dict = test.save()
	var json_string = JSON.stringify(save_dict)
	file.store_line(json_string)
	free_dialogs()

func free_dialogs():
	# if list_children() contains ConfirmationDialog:
	# children[ConfirmationDialog].free
	# print("ConfirmationDialog freed")
	# if list_children() contains FileDialog:
	# children[FileDialog].free
	# print("FileDialog freed")
	print("Dialogs freed")
	pass
