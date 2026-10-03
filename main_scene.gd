extends Node2D

var speed = 150
var screen_size = Vector2()
var window_size = Vector2(200, 200)
var pos = Vector2()
var target = Vector2()
@onready var animated_sprite = $AnimatedSprite2D
@onready var area = $Area2D

var is_dragging = false
var drag_offset = Vector2()

var is_resting = false
var rest_timer = 0.0
var next_anim = ""

func _ready():
	screen_size = Vector2(DisplayServer.screen_get_size())
	pos = Vector2(DisplayServer.window_get_position())
	area.input_event.connect(_on_area_input)
	animated_sprite.animation_finished.connect(_on_animation_finished)
	pick_new_target()

func _on_area_input(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		is_dragging = true
		drag_offset = Vector2(DisplayServer.mouse_get_position()) - pos
		next_anim = ""
		animated_sprite.play("Bark")

func _input(event):
	if is_dragging and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		is_dragging = false
		pick_new_target()

func pick_new_target():
	target = Vector2(
		randf_range(0, screen_size.x - window_size.x),
		randf_range(0, screen_size.y - window_size.y)
	)
	is_resting = false
	next_anim = ""
	animated_sprite.play("Walk_Right")

func start_rest():
	is_resting = true
	next_anim = ""
	var r = randi() % 6
	if r == 0:
		animated_sprite.play("Idle")
		rest_timer = randf_range(2.0, 4.0)
	elif r == 1:
		animated_sprite.play("Sit")
		next_anim = "Sit_Idle"
		rest_timer = randf_range(3.0, 6.0)
	elif r == 2:
		animated_sprite.play("Lie_Down")
		next_anim = "Sleep"
		rest_timer = randf_range(5.0, 9.0)
	elif r == 3:
		animated_sprite.play("Roll")
		rest_timer = randf_range(2.0, 3.0)
	elif r == 4:
		animated_sprite.play("Play_Bow")
		rest_timer = randf_range(1.5, 3.0)
	else:
		animated_sprite.play("Bark")
		rest_timer = randf_range(1.5, 3.0)

func _on_animation_finished():
	if next_anim != "":
		animated_sprite.play(next_anim)
		next_anim = ""

func _physics_process(delta: float) -> void:
	if is_dragging:
		pos = Vector2(DisplayServer.mouse_get_position()) - drag_offset
		DisplayServer.window_set_position(Vector2i(pos))
		return

	if is_resting:
		rest_timer -= delta
		if rest_timer <= 0:
			pick_new_target()
		return

	var to_target = target - pos
	if to_target.length() <= speed * delta:
		pos = target
		DisplayServer.window_set_position(Vector2i(pos))
		start_rest()
		return

	var dir = to_target.normalized()
	pos += dir * speed * delta
	if abs(dir.x) > 0.1:
		animated_sprite.flip_h = dir.x < 0
	pos.x = clamp(pos.x, 0, screen_size.x - window_size.x)
	pos.y = clamp(pos.y, 0, screen_size.y - window_size.y)
	DisplayServer.window_set_position(Vector2i(pos))
