extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void: # called every frame (for visual updates)
	pass


func _on_physics_process(_delta : float) -> void: # called every physics frame
	pass


func _on_next_transitions() -> void: # used to decide if the state should change and emit the transition signal
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void: # called when entering the state - setup
	if player.player_direction == Vector2.UP:
		animated_sprite_2d.play("chopping_back")
	elif player.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("chopping_front")
	elif player.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("chopping_right")
	elif player.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("chopping_left")
	else:
		animated_sprite_2d.play("chopping_front")

func _on_exit() -> void: #called when leaving the state - cleanup
	animated_sprite_2d.stop()
