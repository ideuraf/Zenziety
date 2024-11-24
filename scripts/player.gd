extends CharacterBody2D

const speed = 100.0
var current_dir = "none"
var key_press_times = {
	"move_right": 0,
	"move_left": 0,
	"move_down": 0,
	"move_up": 0
}

func _ready():
	if not InputMap.has_action("move_right"):
		InputMap.add_action("move_right")
		InputMap.action_add_event("move_right", create_key_event(KEY_RIGHT))
		InputMap.action_add_event("move_right", create_key_event(KEY_D))
		
		InputMap.add_action("move_left")
		InputMap.action_add_event("move_left", create_key_event(KEY_LEFT))
		InputMap.action_add_event("move_left", create_key_event(KEY_A))
		
		InputMap.add_action("move_down")
		InputMap.action_add_event("move_down", create_key_event(KEY_DOWN))
		InputMap.action_add_event("move_down", create_key_event(KEY_S))
		
		InputMap.add_action("move_up")
		InputMap.action_add_event("move_up", create_key_event(KEY_UP))
		InputMap.action_add_event("move_up", create_key_event(KEY_W))

func create_key_event(keycode: int) -> InputEventKey:
	var event = InputEventKey.new()
	event.keycode = keycode
	return event

func _physics_process(delta):
	player_movement(delta)

func player_movement(_delta):
	for action in key_press_times.keys():
		if Input.is_action_just_pressed(action):
			key_press_times[action] = Time.get_ticks_msec()
		elif Input.is_action_just_released(action):
			key_press_times[action] = 0
	
	var latest_action = "none"
	var latest_time = 0
	
	for action in key_press_times.keys():
		if Input.is_action_pressed(action) and key_press_times[action] > latest_time:
			latest_time = key_press_times[action]
			latest_action = action
	
	velocity = Vector2.ZERO
	
	match latest_action:
		"move_right":
			current_dir = "right"
			velocity.x = speed
		"move_left":
			current_dir = "left"
			velocity.x = -speed
		"move_down":
			current_dir = "down"
			velocity.y = speed
		"move_up":
			current_dir = "up"
			velocity.y = -speed
		"none":
			current_dir = "none"
	
	play_anims(current_dir)
	move_and_slide()

func play_anims(dir):
	var anim = $AnimatedSprite2D
	
	match dir:
		"right":
			anim.flip_h = false
			anim.play("side_walk")
		"left":
			anim.flip_h = true
			anim.play("side_walk")
		"up":
			anim.flip_h = false
			anim.play("up_walk")
		"down":
			anim.flip_h = false
			anim.play("down_walk")
		"none":
			anim.flip_h = false
			anim.play("idle")
