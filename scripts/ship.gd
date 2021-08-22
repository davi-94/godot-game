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
	
	if Input.is_action_pressed("ui_left") || Input.is_key_pressed(KEY_A):
	  position.x -= 1
	
	if Input.is_action_pressed("ui_right") || Input.is_key_pressed(KEY_D):
	  position.x += 1

	if Input.is_action_pressed("ui_up") || Input.is_key_pressed(KEY_W):
	  position.y -= 1
	
	if Input.is_action_pressed("ui_down") || Input.is_key_pressed(KEY_S):
	  position.y += 1
	
	if Input.is_action_just_pressed("ui_accept"):
		var shoot = PRE_SHOOT.instance()
		get_parent().add_child(shoot)
		shoot.global_position = global_position + Vector2(0, -40)
	
	translate(Vector2(position.x, position.y) * speed * delta)
	
	#minimum left position 21
	#minimum right position 139
	global_position.x = clamp(global_position.x, 21, 139)
	global_position.y = clamp(global_position.y, 24, 266)
		
	pass
