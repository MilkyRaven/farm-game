extends NodeState

@export var character: CharacterBody2D
@export var animated_sprite_2d: AnimatedSprite2D
@export var idle_state_time_interval: float = 5.0

@onready var idle_state_timer: Timer = Timer.new()

var idle_state_timeout: bool = false

func _ready() -> void:
	idle_state_timer.wait_time = idle_state_time_interval
	idle_state_timer.timeout.connect(on_idle_state_timeout)
	add_child(idle_state_timer)	
func _on_process(_delta : float) -> void: # called every frame (for visual updates)
	pass


func _on_physics_process(_delta : float) -> void: # called every physics frame
	pass


func _on_next_transitions() -> void: # used to decide if the state should change and emit the transition signal
	if idle_state_timeout:
		transition.emit("walk")


func _on_enter() -> void: # called when entering the state - setup
	animated_sprite_2d.play("idle")
	idle_state_timeout = false
	idle_state_timer.start()

func _on_exit() -> void: #called when leaving the state - cleanup
	animated_sprite_2d.stop()
	idle_state_timer.stop()
	
func on_idle_state_timeout() -> void:
	idle_state_timeout = true
