extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 250
@export var jump_speed = -300
@export var max_double_click_interval = 10
@export var dash_time = 15
@export var dash_speed = 800

var can_second_jump
const stand = Rect2(410, 238, 60, 92)
const crouch = Rect2(248, 30, 66, 80)
const jump = Rect2(643, 18, 75, 92)
const dash = Rect2(81, 245, 78, 85)

var is_crouch
var is_dash

var right_click_interval
var right_dash_counter

var left_click_interval
var left_dash_counter

var direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_crouch = false
	is_dash = false
	can_second_jump = false
	right_click_interval = max_double_click_interval
	right_dash_counter = dash_time
	left_click_interval = max_double_click_interval
	left_dash_counter = dash_time
	direction = ">"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta):
	if is_dash:
		$Sprite2D.region_rect = dash
	elif not is_on_floor():
		velocity.y += delta * gravity
		$Sprite2D.region_rect = jump
	else:
		if is_crouch:
			$Sprite2D.region_rect = crouch
		else:
			$Sprite2D.region_rect = stand
	
	# Dash right
	if right_dash_counter < dash_time:
		right_dash_counter += 1
		velocity.x = dash_speed
		if right_dash_counter == dash_time:
			is_dash = false
		move_and_slide()
		return
	
	# Dash left
	if left_dash_counter < dash_time:
		left_dash_counter += 1
		velocity.x = -dash_speed
		if left_dash_counter == dash_time:
			is_dash = false
		move_and_slide()
		return
	
	# Counter double click right
	if right_click_interval < max_double_click_interval:
		right_click_interval += 1
		
	# Counter double click left
	if left_click_interval < max_double_click_interval:
		left_click_interval += 1
	
	# Double click
	if Input.is_action_just_pressed("ui_right"):
		if not is_crouch and direction == ">" and right_click_interval < max_double_click_interval:
			is_dash = true
			right_click_interval = max_double_click_interval
			right_dash_counter = 0
		else:
			right_click_interval = 0
			direction = ">"
			$Sprite2D.flip_h = false
	
	if Input.is_action_just_pressed("ui_left"):
		if not is_crouch and direction == "<" and left_click_interval < max_double_click_interval:
			is_dash = true
			left_click_interval = max_double_click_interval
			left_dash_counter = 0
		else:
			left_click_interval = 0
			direction = "<"
			$Sprite2D.flip_h = true
		
	# Jump
	if is_on_floor() and not is_crouch and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_second_jump = true
	# Double jump
	elif can_second_jump and not is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_second_jump = false
		
	# Crouch
	if (is_crouch and test_move(global_transform, Vector2(0, -11))) or (is_on_floor() and Input.is_action_pressed('ui_down')):
		right_dash_counter = dash_time
		left_dash_counter = dash_time
		
		walk_speed = 100
		$Sprite2D.position = Vector2(0, 7)
		$CollisionShape2D.position = Vector2(0, 13)
		$CollisionShape2D.shape.size = Vector2(42, 66)
		is_crouch = true
	# Un-Crouch
	else:
		walk_speed = 250
		$Sprite2D.position = Vector2(0, 0)
		$CollisionShape2D.position = Vector2(0, 7.5)
		$CollisionShape2D.shape.size = Vector2(42, 77)
		is_crouch = false
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
