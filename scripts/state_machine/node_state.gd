class_name NodeState
extends Node

@warning_ignore("unused_signal")
signal transition 


func _on_process(_delta : float) -> void: # called every frame (for visual updates)
	pass


func _on_physics_process(_delta : float) -> void: # called every physics frame
	pass


func _on_next_transitions() -> void: # used to decide if the state should change and emit the transition signal
	pass


func _on_enter() -> void: # called when entering the state - setup
	pass


func _on_exit() -> void: #called when leaving the state - cleanup
	pass
