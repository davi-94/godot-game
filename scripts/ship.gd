extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PRE_SHOOT = preload("res://scenes/shoot.tscn")
export (int) var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  handle_movement(delta);
  pass

# ship controler
func handle_movement(delta):
	var position = Vector2()
	var step = 1
	
	if Input.is_action_pressed("ui_left") || Input.is_key_pressed(KEY_A):
	  position.x -= step
	
	if Input.is_action_pressed("ui_right") || Input.is_key_pressed(KEY_D):
	  position.x += step

	if Input.is_action_pressed("ui_up") || Input.is_key_pressed(KEY_W):
	  position.y -= step
	
	if Input.is_action_pressed("ui_down") || Input.is_key_pressed(KEY_S):
	  position.y += step
	
	if Input.is_action_just_pressed("ui_accept"):
		var shoot = PRE_SHOOT.instance()
		#var shoot_1 = PRE_SHOOT.instance()
		#var shoot_2 = PRE_SHOOT.instance()
		
		get_parent().add_child(shoot)
		#get_parent().add_child(shoot_1)
		#get_parent().add_child(shoot_2)
		
		shoot.global_position = global_position + Vector2(0, -40)
		#shoot_1.global_position = global_position + Vector2(10, -40)
		#shoot_2.global_position = global_position + Vector2(-10, -40)
	
	translate(Vector2(position.x, position.y) * speed * delta)
	
	#minimum left position 21
	#minimum right position 139
	global_position.x = clamp(global_position.x, 21, 139)
	global_position.y = clamp(global_position.y, 24, 266)
		
	pass
