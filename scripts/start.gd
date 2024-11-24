extends Button


var original_scale = Vector2(1, 1)
var hover_scale = Vector2(1.25, 1.25)
var animation_speed = 0.1

func _ready():
	pivot_offset = size / 2
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	var tween = create_tween()
	tween.tween_property(self, "scale", hover_scale, animation_speed).set_trans(Tween.TRANS_CUBIC)

func _on_mouse_exited():
	var tween = create_tween()
	tween.tween_property(self, "scale", original_scale, animation_speed).set_trans(Tween.TRANS_CUBIC)
