class_name Interactable extends Area2D

@export var interact_label = "empty"
@export var interact_type = "empty"
@export var interact_value = "empty"

func set_interact_value(val: String):
	interact_value = val
