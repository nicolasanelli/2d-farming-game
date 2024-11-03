extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponents = $InteractableComponent

func _ready() -> void:
	interactable_component.interactable_activated.connect(_on_interactable_activated)
	interactable_component.interactable_deactivated.connect(_on_interactable_deactivated)
	collision_layer = 1


func _on_interactable_activated() -> void:
	collision_layer = 2
	animated_sprite_2d.play("open_door")


func _on_interactable_deactivated() -> void:
	collision_layer = 1
	animated_sprite_2d.play("close_door")
