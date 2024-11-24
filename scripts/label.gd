extends Label

var time: float = 0
var float_speed: float = 2.0
var float_amplitude: float = 10.0
var scale_speed: float = 10.0
var scale_amount: float = 0.01

var glitch_timer: float = 0
var glitch_duration: float = 0.1 
var glitch_active: bool = false
var next_glitch_time: float = 2.0 
var normal_scale: Vector2 = Vector2.ONE

var initial_position: Vector2

func _ready():
	pivot_offset = size / 2
	initial_position = position
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	next_glitch_time = randf_range(2.0, 4.0)

func _process(delta):
	time += delta
	glitch_timer += delta
	
	if not glitch_active:
		# Normal animation
		var float_offset = sin(time * float_speed) * float_amplitude
		position.y = initial_position.y + float_offset
		var scale_factor = 1.0 + (sin(time * scale_speed) * scale_amount)
		scale = Vector2(scale_factor, scale_factor)
		
		# 
		if glitch_timer >= next_glitch_time:
			glitch_active = true
			glitch_timer = 0
	else:
		if glitch_timer <= glitch_duration:
			position = initial_position + Vector2(
				randf_range(-30, 30),
				randf_range(-30, 30)
			)
			scale = Vector2(
				randf_range(0.5, 2.0),
				randf_range(0.5, 2.0)
			)
			rotation_degrees = randf_range(-20, 20)
		else:
			glitch_active = false
			position = initial_position
			scale = normal_scale
			rotation_degrees = 0
			next_glitch_time = randf_range(2.0, 4.0)
			glitch_timer = 0
