extends Node

const  BUBBLE = preload("res://Open-Metroidvania/Scenes/bubble.tscn")
@onready var player = $"../.."


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		var BubbleInstance = BUBBLE.instantiate()
		
		BubbleInstance.global_position = Vector2(player.global_position.x + 130, player.global_position.y)
		BubbleInstance.linear_velocity = Vector2(50 , -15)
		
		get_tree().get_root().get_node("Game").add_child(BubbleInstance)
