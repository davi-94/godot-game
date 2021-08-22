extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 120

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var directionX = 0

  if Input.is_action_pressed("ui_left"):
	  directionX -= 1
	
  if Input.is_action_pressed("ui_right"):
	  directionX += 1

  translate(Vector2(directionX, 0) * speed * delta)
  pass