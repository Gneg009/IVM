extends Node2D


func _on_старт_pressed() -> void:
	get_tree().change_scene_to_file("res://выбор_уровней.tscn")


func _on_выход_pressed() -> void:
	get_tree().quit()
