class_name CollectableComponent
extends Area2D

@export var collectible_name: String


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("%s collected" % collectible_name)
		get_parent().queue_free()
