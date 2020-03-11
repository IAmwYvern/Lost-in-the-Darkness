extends Node

const DIALOGUE_BOX_SCENE = preload("res://Scenes/GUI/DialogueBox.tscn")
const BRANCHING_DIALOGUE_BOX_SCENE = preload("res://Scenes/GUI/BranchingDialogueBox.tscn")
var resource : Resource
var page_index

func _on_Object_player_interacted(res):
	resource = res
	var dialogue_box = DIALOGUE_BOX_SCENE.instance()
	add_child(dialogue_box)
	dialogue_box.get_node("Panel/Label").text = res.Text[0]

func _on_Object_player_exited():
	get_node("DialogueBox").queue_free()

func _on_Object_page_changed(index):
	page_index = index
	get_node("DialogueBox").free()
	var dialogue_box = DIALOGUE_BOX_SCENE.instance()
	add_child(dialogue_box)
	dialogue_box.set_name("DialogueBox")
	dialogue_box.get_node("Panel/Label").text = resource.Text[index]
	if page_index == resource.Text.size() - 1 and not resource.Answers.empty():
		print("branching the dialogue...")
	
