extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void: # called every frame (for visual updates)
	pass


func _on_physics_process(_delta : float) -> void: # called every physics frame
	pass


func _on_next_transitions() -> void: # used to decide if the state should change and emit the transition signal
	pass


func _on_enter() -> void: # called when entering the state - setup
	animated_sprite_2d.play("walk")


func _on_exit() -> void: #called when leaving the state - cleanup
	animated_sprite_2d.stop()
