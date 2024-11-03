extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene = preload("res://scenes/objects/trees/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(_on_hurt)
	damage_component.max_damaged_reached.connect(_on_max_damaged_reached)


func _on_hurt(hit_damage: int) -> void:
	damage_component.apply_damage(hit_damage)


func _on_max_damaged_reached() -> void:
	call_deferred("add_log_scene")
	print("max damage reached")
	queue_free()


func add_log_scene() -> void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position
	get_parent().add_child(log_instance)