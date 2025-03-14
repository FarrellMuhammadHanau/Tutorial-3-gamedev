extends CharacterBody2D

@export var GRAVITY := 1200
@export var SPEED := 100
@onready var sprite = $AnimatedSprite2D
@onready var attack_sound = $AttackSound
@onready var walk_sound = $WalkingSound

var attack_pos = Vector2(7, 0)
var run_pos = Vector2(0, 0)
var attack = "Attack"
var run = "Run"
var direction = 1
var target : CharacterBody2D
var is_attacking = false

func _ready() -> void:
	walk_sound.play()

func check_on_front() ->bool:
	var relative_pos = target.position.x - position.x
	return relative_pos * direction > 0 # Jika didepan maka positif
	

func _process(delta: float) -> void:
	velocity.y += delta*GRAVITY
	velocity.x = 0
	if not is_attacking:
		if target != null and check_on_front():
			is_attacking = true
			walk_sound.stop()
			sprite.play(attack)
			attack_sound.play()
			target.emit_signal("take_damage", 20)
			
			await sprite.animation_finished
			
			is_attacking = false
			walk_sound.play()
			sprite.play(run)
		elif not test_move(transform, Vector2(direction, 0)):
			velocity.x = SPEED * direction
		else:
			direction *= -1
			if direction == -1:
				sprite.flip_h = true
			else:
				sprite.flip_h = false
		
	move_and_slide()


func _on_attack_area_body_entered(body: Node2D) -> void:
	body = body as CharacterBody2D
	if body:
		target = body
		

func _on_attack_area_body_exited(body: Node2D) -> void:
	if body == target:
		target = null
