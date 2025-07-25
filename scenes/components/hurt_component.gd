#1 - damos un nombre a la clase, esto permite usarla en otros scripts como si fuese un tipo de nodo personalizado (ej. Area2D)
class_name HurtComponent
#hereda de Are2D - es un nodo de su tipo
extends Area2D

#2- declaramos una variable exportada, lo que permtie editarla desde el editor
#tool queda inicializada como none
#tool es la herramienta que necesita el componente
#HurtComponent para reaccionar
@export var tool: DataTypes.Tools = DataTypes.Tools.None

#declaramos una señal personalizada que puedo emitir en mi código cuando el componente sufra daño
signal hurt


func _on_area_entered(area: Area2D) -> void:
	var hit_component = area as HitComponent
	print("user tool", hit_component.current_tool)

	if tool == hit_component.current_tool:
		print("[DEBUG] Tool matched. Emitting signal with:", hit_component.hit_damage)
		hurt.emit(hit_component.hit_damage)
	else:
		print("[DEBUG] Tool did not match. My tool:", tool, "Hit tool:", hit_component.current_tool)
	
