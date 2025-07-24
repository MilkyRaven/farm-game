#1 - damos un nombre a la clase, esto permite usarla en otros scripts como si fuese un tipo de nodo personalizado (ej. Area2D)
class_name HurtComponent
#hereda de Are2D - es un nodo de su tipo
extends Area2D

#2- declaramos una variable exportada, lo que permtie editarla desde el editor
#tool queda inicializada como none
@export var tool: DataTypes.Tools = DataTypes.Tools.None

#declaramos una señal personalizada que puedo emitir en mi código cuando el componente sufra daño
signal hurt


func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	
	if tool == hit_component.current_tool:
			hurt.emit(hit_component.hit_damage)
