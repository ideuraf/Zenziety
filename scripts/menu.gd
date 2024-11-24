extends Control

func _on_start_pressed() -> void:
	var start_button = $VBoxContainer/Start
	
	var tween = create_tween()
	
	var original_pos = start_button.position
	var original_scale = start_button.scale
	var original_rotation = start_button.rotation_degrees
	
	start_button.pivot_offset = start_button.size / 2
	
	for i in range(1):
		tween.tween_property(start_button, "position", 
			original_pos + Vector2(randf_range(-30, 30), randf_range(-30, 30)), 
			0.03)
		
		tween.tween_property(start_button, "scale",
			Vector2(randf_range(0.4, 2.0), randf_range(0.4, 2.0)),
			0.03)
			
		tween.tween_property(start_button, "rotation_degrees",
			randf_range(-45, 45),
			0.03)
			
		if randf() > 0.7:
			tween.tween_property(start_button, "scale",
				Vector2(randf_range(0.2, 2.5), randf_range(0.2, 2.5)),
				0.02)
			tween.tween_property(start_button, "rotation_degrees",
				randf_range(-90, 90),
				0.02)
	
	tween.tween_property(start_button, "position", original_pos, 0.01)
	tween.tween_property(start_button, "scale", original_scale, 0.01)
	tween.tween_property(start_button, "rotation_degrees", original_rotation, 0.01)
	
	tween.finished.connect(func(): get_tree().change_scene_to_file("res://scenes/homeworld.tscn"))

func _on_quit_pressed() -> void:
	var quit_button = $VBoxContainer/Quit
	
	var tween = create_tween()
	
	var original_pos = quit_button.position
	var original_scale = quit_button.scale
	var original_rotation = quit_button.rotation_degrees
	
	quit_button.pivot_offset = quit_button.size / 2
	
	for i in range(1):
		tween.tween_property(quit_button, "position", 
			original_pos + Vector2(randf_range(-30, 30), randf_range(-30, 30)), 
			0.03) 
		
		tween.tween_property(quit_button, "scale",
			Vector2(randf_range(0.4, 2.0), randf_range(0.4, 2.0)),
			0.03)
			
		tween.tween_property(quit_button, "rotation_degrees",
			randf_range(-45, 45),
			0.03)
			
		if randf() > 0.7:
			tween.tween_property(quit_button, "scale",
				Vector2(randf_range(0.2, 2.5), randf_range(0.2, 2.5)),
				0.02)
			tween.tween_property(quit_button, "rotation_degrees",
				randf_range(-90, 90),
				0.02)
	

	tween.tween_property(quit_button, "position", original_pos, 0.01)
	tween.tween_property(quit_button, "scale", original_scale, 0.01)
	tween.tween_property(quit_button, "rotation_degrees", original_rotation, 0.01)
	

	tween.finished.connect(func(): get_tree().quit())
